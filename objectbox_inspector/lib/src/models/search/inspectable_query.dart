import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'package:objectbox_inspector/src/models/search/inspectable_condition.dart';

class InspectableQuery {
  final List<InspectableCondition> conditions;

  InspectableQuery({
    required this.conditions,
  });

  List<InspectableEntity> execute(List<InspectableEntity> entities) {
    return entities.where((entity) {
      return conditions.every((condition) {
        return condition.matches(entity);
      });
    }).toList();
  }
}
