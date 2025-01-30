import 'package:objectbox_inspector/objectbox_inspector.dart';

class InspectableEntity {
  final int id;
  final List<InspectableProperty> properties;

  InspectableEntity({
    required this.id,
    required this.properties,
  });
}
