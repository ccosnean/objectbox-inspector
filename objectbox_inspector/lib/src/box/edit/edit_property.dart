import 'package:flutter/material.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'package:objectbox_inspector/src/box/edit/bool_property_editor.dart';
import 'package:objectbox_inspector/src/box/edit/datetime_property_editor.dart';
import 'package:objectbox_inspector/src/box/edit/double_property_editor.dart';
import 'package:objectbox_inspector/src/box/edit/doublelist_property_editor.dart';
import 'package:objectbox_inspector/src/box/edit/edit_result.dart';
import 'package:objectbox_inspector/src/box/edit/int_property_editor.dart';
import 'package:objectbox_inspector/src/box/edit/intlist_property_editor.dart';
import 'package:objectbox_inspector/src/box/edit/string_property_editor.dart';
import 'package:objectbox_inspector/src/box/edit/stringlist_property_editor.dart';

Future<EditResult> editProperty<T>(
  BuildContext context,
  InspectableProperty<T> property,
) async {
  final result = await showDialog<EditResult>(
    context: context,
    builder: (context) => EditPropertyAlert<T>(
      property: property,
    ),
  );

  return result ?? EditResult(value: null, wasChanged: false);
}

class EditPropertyAlert<T> extends StatefulWidget {
  final InspectableProperty<T> property;

  const EditPropertyAlert({
    super.key,
    required this.property,
  });

  @override
  State<EditPropertyAlert> createState() => _EditPropertyAlertState();
}

class _EditPropertyAlertState extends State<EditPropertyAlert> {
  dynamic value;

  @override
  void initState() {
    super.initState();

    value = widget.property.value;
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return AlertDialog(
      title: Text(widget.property.name),
      content: EditPropertyValue(
        initialValue: value,
        type: widget.property.type,
        onChanged: (newValue) {
          value = newValue;
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(
              context,
              EditResult(
                value: value,
                wasChanged: false,
              ),
            );
          },
          style: TextButton.styleFrom(
            foregroundColor: cs.secondary,
          ),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(
              context,
              EditResult(
                value: value,
                wasChanged: true,
              ),
            );
          },
          child: Text(
            "Save",
            style: tt.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class EditPropertyValue<T> extends StatelessWidget {
  final String type;
  final T? initialValue;
  final ValueChanged<T?> onChanged;

  const EditPropertyValue({
    super.key,
    required this.type,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (type.startsWith('List<String>')) {
      return StringlistPropertyEditor(
        isNullable: type.contains('?'),
        initialValue: initialValue as List<String>?,
        onChanged: onChanged as ValueChanged<List<String>?>,
      );
    }

    if (type.startsWith('List<int>')) {
      return IntlistPropertyEditor(
        isNullable: type.contains('?'),
        initialValue: initialValue as List<int>?,
        onChanged: onChanged as ValueChanged<List<int>?>,
      );
    }

    if (type.startsWith('List<double>')) {
      return DoublelistPropertyEditor(
        isNullable: type.contains('?'),
        initialValue: initialValue as List<double>?,
        onChanged: onChanged as ValueChanged<List<double>?>,
      );
    }

    if (type.startsWith('DateTime')) {
      return DateTimePropertyEditor(
        isNullable: type.contains('?'),
        initialValue: initialValue as DateTime?,
        onChanged: onChanged as ValueChanged<DateTime?>,
      );
    }

    if (type.startsWith('int')) {
      return IntPropertyEditor(
        isNullable: type.contains('?'),
        initialValue: initialValue as int?,
        onChanged: onChanged as ValueChanged<int?>,
      );
    }

    if (type.startsWith('double')) {
      return DoublePropertyEditor(
        isNullable: type.contains('?'),
        initialValue: initialValue as double?,
        onChanged: onChanged as ValueChanged<double?>,
      );
    }

    if (type.startsWith('String')) {
      return StringPropertyEditor(
        isNullable: type.contains('?'),
        initialValue: initialValue as String?,
        onChanged: onChanged as ValueChanged<String?>,
      );
    }

    if (type.startsWith('bool')) {
      return BoolPropertyEditor(
        isNullable: type.contains('?'),
        initialValue: initialValue as bool?,
        onChanged: onChanged as ValueChanged<bool?>,
      );
    }

    return Text("Unsupported type for editing $type");
  }
}
