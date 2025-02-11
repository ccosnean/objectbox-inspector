import 'package:flutter/material.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'package:objectbox_inspector/src/box/search/fields/bool_field.dart';
import 'package:objectbox_inspector/src/box/search/fields/double_text_field.dart';
import 'package:objectbox_inspector/src/box/search/fields/int_text_field.dart';
import 'package:objectbox_inspector/src/box/search/fields/string_text_field.dart';
import 'package:objectbox_inspector/src/models/search/inspectable_condition.dart';
import 'package:objectbox_inspector/src/models/search/inspectable_operation.dart';

class ConditionRow extends StatefulWidget {
  final InspectableCondition condition;
  final List<InspectableProperty> properties;
  final ValueChanged<InspectableCondition> onChanged;

  const ConditionRow({
    super.key,
    required this.condition,
    required this.properties,
    required this.onChanged,
  });

  @override
  State<ConditionRow> createState() => _ConditionRowState();
}

class _ConditionRowState extends State<ConditionRow> {
  InspectableProperty? selectedProperty;
  InspectableOperation? selectedOperation;
  dynamic value;
  List<InspectableProperty> supportedProperties = [];
  List<InspectableOperation> supportedOperations = [];

  @override
  void initState() {
    super.initState();

    selectedProperty = widget.condition.property;
    selectedOperation = widget.condition.operation;
    value = widget.condition.value;

    _updateSupportedPropertiesAndOperations();
  }

  void _updateSupportedPropertiesAndOperations() {
    var supportedTypes = [];
    if (selectedOperation != null) {
      supportedTypes = selectedOperation!.supportedTypes;
    } else {
      supportedTypes = widget.condition.operation.supportedTypes;
    }

    supportedProperties = widget.properties
        .where((prop) =>
            supportedTypes.where((type) => type.type == prop.type).isNotEmpty)
        .toList();

    if (!supportedProperties.contains(selectedProperty)) {
      selectedProperty = supportedProperties.first;
    }

    supportedOperations = InspectableOperation.values
        .where((operation) => operation.supportedTypes
            .where((s) => selectedProperty?.type == s.type)
            .isNotEmpty)
        .toList();
  }

  void _updateCondition() {
    widget.onChanged(
      InspectableCondition(
        property: selectedProperty!,
        operation: selectedOperation!,
        value: value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: cs.primaryContainer),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButton<InspectableProperty>(
            key: ValueKey(supportedProperties),
            icon: const SizedBox(),
            underline: const SizedBox(),
            value: selectedProperty,
            onChanged: (propName) {
              setState(() {
                selectedProperty = propName;
                value = null;
                _updateSupportedPropertiesAndOperations();
              });

              _updateCondition();
            },
            items: supportedProperties
                .map(
                  (prop) => DropdownMenuItem(
                    value: prop,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(prop.name),
                    ),
                  ),
                )
                .toList(),
          ),
          DropdownButton<String>(
            key: ValueKey(supportedOperations),
            icon: const SizedBox(),
            underline: const SizedBox(),
            value: selectedOperation?.name,
            onChanged: (operationName) {
              setState(() {
                selectedOperation = InspectableOperation.values.firstWhere(
                  (e) => e.name == operationName,
                );

                _updateSupportedPropertiesAndOperations();
              });

              _updateCondition();
            },
            items: supportedOperations
                .map(
                  (operation) => DropdownMenuItem(
                    value: operation.name,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(operation.name),
                    ),
                  ),
                )
                .toList(),
          ),
          _buildTextFieldForType(),
        ],
      ),
    );
  }

  Widget _buildTextFieldForType() {
    if (selectedOperation?.requiresValue == false) {
      return const SizedBox();
    }

    switch (selectedProperty?.type) {
      case 'String':
        return StringTextField(
          initialValue: value,
          onChanged: (value) {
            setState(() {
              this.value = value;
            });

            _updateCondition();
          },
        );
      case 'int':
        return IntTextField(
          onChanged: (value) {
            setState(() {
              this.value = value;
            });

            _updateCondition();
          },
        );
      case 'double':
        return DoubleTextField(
          initialValue: value,
          onChanged: (value) {
            setState(() {
              this.value = value;
            });

            _updateCondition();
          },
        );

      case 'bool':
        return BoolField(
          initialValue: value,
          onChanged: (value) {
            setState(() {
              this.value = value;
            });

            _updateCondition();
          },
        );
      default:
        return const SizedBox();
    }
  }
}
