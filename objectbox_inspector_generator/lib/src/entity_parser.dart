// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'dart:async';

import 'package:analyzer/dart/element/element2.dart';
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
      final classElement = annotation.element as ClassElement2;
      final name = classElement.name3!;
      final fields = classElement.fields2;
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

  String _buildInspectableBox(String name, List<FieldElement2> fields) {
    final buffer = StringBuffer();

    buffer.writeln("InspectableBox build${name}InspectableBox(Store store) {");
    buffer.writeln("final box = store.box<$name>();");
    buffer.writeln("final allEntities = box.getAll();");

    var idName = "id";
    for (final field in fields) {
      if (_idChecker.annotationsOfExact(field).isNotEmpty) {
        idName = field.name3!;
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
      if (_transientChecker.annotationsOfExact(field).isNotEmpty) {
        log.info(
          " Skipping property '${field.name3!}': annotated with @Transient.",
        );
        continue;
      }

      final type = field.type.getDisplayString(
        // ignore:deprecated_member_use
        withNullability: true,
      );
      if (type.contains('ToOne')) {
        final runtimeType = type.replaceAll("ToOne<", "").replaceAll(">", "");
        buffer.writeln('''
          InspectableProperty(
            name: '${field.name3!}',
            toOneRelation: ToOneRelation<$runtimeType>(rel: entity.${field.name3!}),
          ),
        ''');
      } else if (type.contains('ToMany')) {
        final runtimeType = type.replaceAll("ToMany<", "").replaceAll(">", "");
        buffer.writeln('''
          InspectableProperty(
            name: '${field.name3!}',
            toManyRelation: ToManyRelation<$runtimeType>(
              rel: entity.${field.name3!},
              ids: entity.${field.name3!}.map((e) => e.$idName).toList(),
            ),
          ),
        ''');
      } else {
        buffer.writeln('''
        InspectableProperty<$type>(
          name: '${field.name3!}',
          value: entity.${field.name3!},
      ''');
        if (field.name3! != idName && !field.isFinal) {
          buffer.writeln('''
        onChanged: (value) {
          entity.${field.name3!} = value;
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

  @override
  late final buildExtensions = {
    Constants.dartFile: [Constants.tmpFile]
  };
}
