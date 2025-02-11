import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'package:objectbox_inspector/src/models/search/inspectable_operation.dart';

/// Will support more types in the future.
enum SupportedPropertyTypes {
  string(type: 'String'),
  int(type: 'int'),
  double(type: 'double'),
  boolean(type: 'bool'),
  ;

  final String type;

  const SupportedPropertyTypes({required this.type});

  bool matches(InspectableProperty property) {
    return property.type == type;
  }
}

class InspectableCondition {
  final InspectableProperty property;
  final InspectableOperation operation;
  final dynamic value;

  InspectableCondition({
    required this.property,
    required this.operation,
    required this.value,
  });

  bool matches(InspectableEntity entity) {
    final entityProperty =
        entity.properties.firstWhere((p) => p.name == property.name);

    switch (operation) {
      case InspectableOperation.equal:
        if (entityProperty.value == null || value == null) {
          return true;
        }

        return entityProperty.value == value;
      case InspectableOperation.notEqual:
        if (entityProperty.value == null || value == null) {
          return true;
        }
        return entityProperty.value != value;
      case InspectableOperation.contains:
        if (entityProperty.value == null || value == null) {
          return true;
        }
        return entityProperty.value.toString().contains(value.toString());
      case InspectableOperation.startsWith:
        if (entityProperty.value == null || value == null) {
          return true;
        }
        return entityProperty.value.toString().startsWith(value.toString());
      case InspectableOperation.endsWith:
        if (entityProperty.value == null || value == null) {
          return true;
        }
        return entityProperty.value.toString().endsWith(value.toString());
      case InspectableOperation.greaterThan:
        if (entityProperty.value == null || value == null) {
          return true;
        }
        return entityProperty.value > value;
      case InspectableOperation.lessThan:
        if (entityProperty.value == null || value == null) {
          return true;
        }
        return entityProperty.value < value;
      case InspectableOperation.greaterThanOrEqual:
        if (entityProperty.value == null || value == null) {
          return true;
        }
        return entityProperty.value >= value;
      case InspectableOperation.lessThanOrEqual:
        if (entityProperty.value == null || value == null) {
          return true;
        }
        return entityProperty.value <= value;
      case InspectableOperation.isNull:
        return entityProperty.value == null;
      case InspectableOperation.isNotNull:
        return entityProperty.value != null;
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is InspectableCondition) {
      return property == other.property &&
          operation == other.operation &&
          value == other.value;
    }
    return false;
  }

  @override
  int get hashCode => property.hashCode ^ operation.hashCode ^ value.hashCode;
}
