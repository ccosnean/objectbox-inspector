import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

@Entity()
class Category {
  @Id()
  int dbId;

  String name;

  String? description;
  String? iconName;

  bool boolProperty;
  bool? nullableBoolProperty;

  int amountOfItems;
  int? nullableAmountOfItems;
  final int nonEditableProperty;
  double doubleProperty;
  double? nullableDoubleProperty;
  List<String> stringListProperty;
  List<String>? nullableStringListProperty;
  List<int> intListProperty;
  List<int>? nullableIntListProperty;
  List<double> doubleListProperty;
  List<double>? optionalDoubleListProperty;

  @Transient()
  String testProperty = 'testTransientProperty';

  Int8List? int8ListProperty;
  Uint8List? uint8ListProperty;
  Int16List? int16ListProperty;
  Uint16List? uint16ListProperty;
  Int32List? int32ListProperty;
  Uint32List? uint32ListProperty;
  Int64List? int64ListProperty;

  Category({
    required this.name,
    this.description,
    this.iconName,
    this.nonEditableProperty = 0,
    this.amountOfItems = 0,
    this.doubleProperty = 0.0,
    this.stringListProperty = const [],
    this.intListProperty = const [],
    this.doubleListProperty = const [],
    this.boolProperty = false,
    this.nullableBoolProperty,
    this.optionalDoubleListProperty,
    this.nullableAmountOfItems,
    this.int8ListProperty,
    this.uint8ListProperty,
    this.int16ListProperty,
    this.uint16ListProperty,
    this.int32ListProperty,
    this.uint32ListProperty,
    this.int64ListProperty,
  }) : dbId = 0;
}
