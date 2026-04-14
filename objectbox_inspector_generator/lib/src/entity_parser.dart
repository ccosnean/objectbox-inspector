// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'dart:async';

import 'package:build/build.dart';
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_inspector_generator/src/code_storage.dart';
import 'package:objectbox_inspector_generator/src/constants.dart';
import 'package:source_gen/source_gen.dart';

class EntityParser extends Builder {
  final _entityChecker = const TypeChecker.typeNamed(Entity);
  final _idChecker = const TypeChecker.typeNamed(Id);
  final _transientChecker = const TypeChecker.typeNamed(Transient);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    LibraryReader libReader;
    try {
      libReader = LibraryReader(await buildStep.inputLibrary);
    } catch (e) {
      log.info(" Skipping part file.");
      return;
    }
    final annotatedElements = libReader.annotatedWith(_entityChecker);

    for (final annotation in annotatedElements) {
      final classElement = annotation.element as dynamic;
      final name = _className(classElement);
      final fields = _classFields(classElement);
      final segments = buildStep.inputId.pathSegments;
      final filePath = segments.sublist(1).join('/');

      CodeStorage.addImport("import '$filePath';");

      CodeStorage.addInspectableBoxCall(
        "build${name}InspectableBox(store),",
      );

      CodeStorage.addInspectableBoxDefinition(
        _buildInspectableBox(name, fields),
      );
    }
  }

  String _buildInspectableBox(String name, List<dynamic> fields) {
    final buffer = StringBuffer();

    buffer.writeln("InspectableBox build${name}InspectableBox(Store store) {");
    buffer.writeln("final box = store.box<$name>();");
    buffer.writeln("final allEntities = box.getAll();");

    var idName = "id";
    for (final field in fields) {
      // `source_gen` changed TypeChecker APIs between major versions
      // (Element2 vs Element). Using dynamic keeps compatibility.
      final fieldForChecker = field as dynamic;
      if (_idChecker.annotationsOfExact(fieldForChecker).isNotEmpty) {
        idName = _fieldName(field);
      }
    }

    buffer.writeln('''
      final entities = allEntities
            .map(
              (entity) => InspectableEntity(
                id: entity.$idName,
                properties: [
    ''');

//   final bool isRelation;
    // final String? relationPreviewString;
    // final String? relationTargetBoxName;
    for (final field in fields) {
      final fieldForChecker = field as dynamic;
      if (_transientChecker.annotationsOfExact(fieldForChecker).isNotEmpty) {
        log.info(
          " Skipping property '${_fieldName(field)}': annotated with @Transient.",
        );
        continue;
      }

      final type = _fieldType(field).getDisplayString(
        // ignore:deprecated_member_use
        withNullability: true,
      );
      if (type.contains('ToOne')) {
        final runtimeType = type.replaceAll("ToOne<", "").replaceAll(">", "");
        buffer.writeln('''
          InspectableProperty(
            name: '${_fieldName(field)}',
            toOneRelation: ToOneRelation<$runtimeType>(rel: entity.${_fieldName(field)}),
          ),
        ''');
      } else if (type.contains('ToMany')) {
        final runtimeType = type.replaceAll("ToMany<", "").replaceAll(">", "");
        buffer.writeln('''
          InspectableProperty(
            name: '${_fieldName(field)}',
            toManyRelation: ToManyRelation<$runtimeType>(
              rel: entity.${_fieldName(field)},
              ids: entity.${_fieldName(field)}.map((e) => e.$idName).toList(),
            ),
          ),
        ''');
      } else {
        buffer.writeln('''
        InspectableProperty<$type>(
          name: '${_fieldName(field)}',
          value: entity.${_fieldName(field)},
      ''');
        if (_fieldName(field) != idName && !_fieldIsFinal(field)) {
          buffer.writeln('''
        onChanged: (value) {
          entity.${_fieldName(field)} = value;
          box.put(entity);
        },
      ''');
        }
        buffer.writeln('),');
      }
    }

    buffer.writeln('''
          ],
        ),
      )
      .toList();
    ''');

    buffer.writeln('''
    return InspectableBox(
      boxName: '$name',
      maxEntities: box.count(),
      entityGetter: () => entities,
    );
    ''');

    buffer.writeln("}");

    return buffer.toString();
  }

  String _className(dynamic classElement) {
    try {
      return classElement.name3 as String;
    } catch (_) {
      return classElement.name as String;
    }
  }

  List<dynamic> _classFields(dynamic classElement) {
    try {
      return (classElement.fields2 as List).cast<dynamic>();
    } catch (_) {
      return (classElement.fields as List).cast<dynamic>();
    }
  }

  String _fieldName(dynamic field) {
    try {
      return field.name3 as String;
    } catch (_) {
      return field.name as String;
    }
  }

  dynamic _fieldType(dynamic field) => field.type;

  bool _fieldIsFinal(dynamic field) => field.isFinal as bool;

  @override
  late final buildExtensions = {
    Constants.dartFile: [Constants.tmpFile]
  };
}
