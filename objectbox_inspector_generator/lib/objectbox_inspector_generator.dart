library objectbox_inspector_generator;

import 'package:build/build.dart';

import 'package:objectbox_inspector_generator/src/code_builder.dart';
import 'package:objectbox_inspector_generator/src/entity_parser.dart';

/// The output file name for the generated code in the directory of your project.
const outputFile = 'lib/objectbox.inspector.g.dart';

/// A builder that parses ObjectBox entities and generates inspection code.
///
/// This builder scans the codebase for classes annotated with @Entity and generates
/// code to make them inspectable in the ObjectBox Inspector UI. The generated code
/// includes property inspection, relation handling, and entity metadata.
Builder parseEntitiesAndGenerateItsCode(
  BuilderOptions options,
) =>
    EntityParser();

/// A builder that merges the parsed entity code and produces the final output file.
Builder mergeCodeAndProduceOutput(
  BuilderOptions options,
) =>
    CodeBuilder();
