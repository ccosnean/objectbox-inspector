// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'dart:async';

import 'package:build/build.dart';
import 'package:objectbox_inspector_generator/src/code_storage.dart';
import 'package:objectbox_inspector_generator/src/constants.dart';

class CodeBuilder extends Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    CodeStorage.addImport("import 'dart:typed_data';");

    final code = CodeStorage.build();

    final inputId = buildStep.inputId;
    final assetId = AssetId(inputId.package, Constants.outputFile);

    await buildStep.writeAsString(
      assetId,
      code,
    );
  }

  @override
  late final buildExtensions = {
    Constants.pubspecFile: [Constants.outputFile]
  };
}
