import 'package:objectbox_inspector/src/models/inspectable_entity.dart';

typedef EntityGetter = List<InspectableEntity> Function();

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
