import 'package:objectbox_inspector/src/models/inspectable_entity.dart';

/// A callback that is ment to get the entities from the box.
typedef EntityGetter = List<InspectableEntity> Function();

/// A class that represents an inspectable ObjectBox box.
///
/// The [InspectableBox] contains metadata about a box and provides access to its entities
/// through the [entityGetter] callback.
///
/// The [boxName] is the name of the box class (e.g. "Person", "Order").
/// The [maxEntities] represents the total count of entities in the box.
/// The [entityGetter] is a callback that returns the list of [InspectableEntity] objects
/// representing the entities in the box.
///
/// This class is typically instantiated by generated code from the objectbox_inspector_generator
/// package and used by the ObjectBox Inspector UI to display box contents.
class InspectableBox<T> {
  final EntityGetter entityGetter;
  final int maxEntities;
  final String boxName;

  InspectableBox({
    required this.entityGetter,
    this.maxEntities = 0,
    required this.boxName,
  });
}
