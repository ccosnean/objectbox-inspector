import 'package:objectbox_inspector/src/models/search/inspectable_condition.dart';

enum InspectableOperation {
  equal(
    supportedTypes: SupportedPropertyTypes.values,
    requiresValue: true,
  ),
  notEqual(
    supportedTypes: SupportedPropertyTypes.values,
    requiresValue: true,
  ),
  contains(
    supportedTypes: [SupportedPropertyTypes.string],
    requiresValue: true,
  ),
  startsWith(
    supportedTypes: [SupportedPropertyTypes.string],
    requiresValue: true,
  ),
  endsWith(
    supportedTypes: [SupportedPropertyTypes.string],
    requiresValue: true,
  ),
  greaterThan(
    supportedTypes: [SupportedPropertyTypes.int, SupportedPropertyTypes.double],
    requiresValue: true,
  ),
  lessThan(
    supportedTypes: [SupportedPropertyTypes.int, SupportedPropertyTypes.double],
    requiresValue: true,
  ),
  greaterThanOrEqual(
    supportedTypes: [SupportedPropertyTypes.int, SupportedPropertyTypes.double],
    requiresValue: true,
  ),
  lessThanOrEqual(
    supportedTypes: [SupportedPropertyTypes.int, SupportedPropertyTypes.double],
    requiresValue: true,
  ),
  isNull(
    supportedTypes: SupportedPropertyTypes.values,
    requiresValue: false,
  ),
  isNotNull(
    supportedTypes: SupportedPropertyTypes.values,
    requiresValue: false,
  ),
  ;

  final List<SupportedPropertyTypes> supportedTypes;
  final bool requiresValue;

  const InspectableOperation({
    required this.supportedTypes,
    this.requiresValue = true,
  });
}
