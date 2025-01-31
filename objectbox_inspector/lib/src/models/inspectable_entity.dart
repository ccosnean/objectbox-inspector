import 'package:objectbox_inspector/objectbox_inspector.dart';

/// A class that represents an inspectable entity from an ObjectBox box.
///
/// The [InspectableEntity] contains the entity's ID and a list of its properties
/// that can be inspected in the ObjectBox Inspector UI.
///
/// The [id] is the unique identifier of the entity in its box.
/// The [properties] is a list of [InspectableProperty] objects representing the
/// entity's properties and their values.
///
/// This class is typically instantiated by generated code from the objectbox_inspector_generator
/// package and used by the ObjectBox Inspector UI to display entity details.
///
/// Example:
/// ```dart
/// final entity = InspectableEntity(
///   id: 1,
///   properties: [
///     InspectableProperty(name: 'name', value: 'John'),
///     InspectableProperty(name: 'age', value: 30),
///   ],
/// );
/// ```
class InspectableEntity {
  final int id;
  final List<InspectableProperty> properties;

  InspectableEntity({
    required this.id,
    required this.properties,
  });
}
