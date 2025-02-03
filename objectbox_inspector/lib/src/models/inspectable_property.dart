import 'package:flutter/foundation.dart';
import 'package:objectbox/objectbox.dart';

/// A class that represents an inspectable property of an ObjectBox entity.
///
/// The [InspectableProperty] contains metadata about a property and its value,
/// including support for ToOne and ToMany relations.
///
/// The [name] is the name of the property.
/// The [value] is the property's value for primitive types.
/// The [toOneRelation] contains the ToOne relation if this property is a ToOne relation.
/// The [toManyRelation] contains the ToMany relation if this property is a ToMany relation.
///
/// This class is typically instantiated by generated code from the objectbox_inspector_generator
/// package and used by the ObjectBox Inspector UI to display property details.
///
/// Example:
/// ```dart
/// // For a primitive property
/// final nameProperty = InspectableProperty(
///   name: 'name',
///   value: 'John',
/// );
///
/// // For a ToOne relation
/// final authorProperty = InspectableProperty(
///   name: 'author',
///   toOneRelation: ToOneRelation(rel: post.author),
/// );
///
/// // For a ToMany relation
/// final commentsProperty = InspectableProperty(
///   name: 'comments',
///   toManyRelation: ToManyRelation(rel: post.comments),
/// );
/// ```
class InspectableProperty<T> {
  final String name;
  T? value;
  final ToOneRelation? toOneRelation;
  final ToManyRelation? toManyRelation;
  final ValueChanged<dynamic>? onChanged;

  final String type;

  InspectableProperty({
    required this.name,
    this.value,
    this.toOneRelation,
    this.toManyRelation,
    this.onChanged,
  }) : type = T.toString();
}

/// A class that represents a ToOne relation of an ObjectBox entity.
///
/// The [ToOneRelation] contains a [ToOne] relation and provides a preview string
/// and a target box name for display in the ObjectBox Inspector UI.
///
/// The [previewString] is a string that provides a preview of the ToOne relation,
/// showing the target object's ID if the target is not an instance of the target type.
///
/// The [targetBoxName] is the name of the target box type (e.g. "Person", "Order").
///
/// This class is typically instantiated by generated code from the objectbox_inspector_generator
/// package and used by the ObjectBox Inspector UI to display ToOne relation details.
class ToOneRelation<T> {
  final ToOne<T> rel;

  String get previewString {
    final preview = rel.target.toString();

    if (preview.contains("Instance of")) {
      return "ToOne<$targetBoxName>(id: ${rel.targetId})";
    }

    return preview;
  }

  String get targetBoxName => T.toString();

  ToOneRelation({
    required this.rel,
  });
}

/// A class that represents a ToMany relation of an ObjectBox entity.
///
/// The [ToManyRelation] contains a [ToMany] relation and provides a preview string
/// and a target box name for display in the ObjectBox Inspector UI.
///
/// The [previewString] is a string that provides a preview of the ToMany relation,
/// showing the count of the related objects.
///
/// The [targetBoxName] is the name of the target box type (e.g. "Person", "Order").
///
/// This class is typically instantiated by generated code from the objectbox_inspector_generator
/// package and used by the ObjectBox Inspector UI to display ToMany relation details.
class ToManyRelation<T> {
  final ToMany<T> rel;
  final List<int> ids;

  String get previewString {
    return "ToMany<$targetBoxName>(${ids.length})";
  }

  String get targetBoxName => T.toString();

  ToManyRelation({
    required this.rel,
    required this.ids,
  });
}
