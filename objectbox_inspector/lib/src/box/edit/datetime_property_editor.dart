import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class DateTimePropertyEditor extends StatefulWidget {
  final bool isNullable;
  final DateTime? initialValue;
  final ValueChanged<DateTime?> onChanged;

  const DateTimePropertyEditor({
    super.key,
    required this.isNullable,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<DateTimePropertyEditor> createState() => _DateTimePropertyEditorState();
}

class _DateTimePropertyEditorState extends State<DateTimePropertyEditor> {
  DateTime? initialValue;

  @override
  void initState() {
    super.initState();
    initialValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DateTimeFormField(
            initialValue: initialValue,
            canClear: widget.isNullable,
            onChanged: (newValue) {
              widget.onChanged(newValue);
            },
            pickerPlatform: DateTimeFieldPickerPlatform.material,
          ),
        ),
      ],
    );
  }
}
