// ignore_for_file: depend_on_referenced_packages

import 'package:dart_style/dart_style.dart';
import 'package:pub_semver/pub_semver.dart' as pub_semver;

class CodeStorage {
  static const header = '''
// GENERATED CODE - DO NOT MODIFY BY HAND
''';

  static final List<String> _imports = [
    "import 'package:objectbox/objectbox.dart';",
    "import 'package:objectbox_inspector/objectbox_inspector.dart';",
  ];

  static final List<String> _inspectableBoxesCalls = [];
  static final List<String> _inspectableBoxesDefinitions = [];

  static void addImport(String import) {
    _imports.add(import);
  }

  static void addInspectableBoxCall(String inspectableBoxCall) {
    _inspectableBoxesCalls.add(inspectableBoxCall);
  }

  static void addInspectableBoxDefinition(String inspectableBoxDefinition) {
    _inspectableBoxesDefinitions.add(inspectableBoxDefinition);
  }

  static String build() {
    final buffer = StringBuffer();

    buffer.writeln(header);
    buffer.writeln();

    for (final import in _imports) {
      buffer.writeln(import);
    }

    buffer.writeln(
      'List<InspectableBox> getInspectableBoxes(Store store) { return [',
    );

    for (final inspectableBoxCall in _inspectableBoxesCalls) {
      buffer.writeln(inspectableBoxCall);
    }

    buffer.writeln('];}');
    buffer.writeln();

    for (final inspectableBoxDefinition in _inspectableBoxesDefinitions) {
      buffer.writeln(inspectableBoxDefinition);
      buffer.writeln();
    }

    return DartFormatter(
      languageVersion: pub_semver.Version.parse('3.6.1'),
    ).format(buffer.toString());
  }
}
