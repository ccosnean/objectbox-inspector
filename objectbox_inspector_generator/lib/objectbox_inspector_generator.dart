library objectbox_inspector_generator;

import 'package:build/build.dart';

import 'package:objectbox_inspector_generator/src/code_builder.dart';
import 'package:objectbox_inspector_generator/src/entity_parser.dart';

const outputFile = 'lib/objectbox.inspector.g.dart';

Builder parseEntitiesAndGenerateItsCode(
  BuilderOptions options,
) =>
    EntityParser();

Builder mergeCodeAndProduceOutput(
  BuilderOptions options,
) =>
    CodeBuilder();
