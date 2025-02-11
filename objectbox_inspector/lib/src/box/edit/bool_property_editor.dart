import 'package:flutter/material.dart';
import 'package:objectbox_inspector/src/box/edit/buttons/nullable_button.dart';

class BoolPropertyEditor extends StatefulWidget {
  final bool? initialValue;
  final ValueChanged<bool?> onChanged;
  final bool isNullable;

  const BoolPropertyEditor({
    super.key,
    this.initialValue,
    required this.onChanged,
    this.isNullable = false,
  });

  @override
  State<BoolPropertyEditor> createState() => _BoolPropertyEditorState();
}

class _BoolPropertyEditorState extends State<BoolPropertyEditor> {
  bool? value;
  bool isNull = false;

  @override
  void initState() {
    if (widget.initialValue != null) {
      value = widget.initialValue;
    }

    isNull = widget.initialValue == null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            value.toString(),
            style: tt.bodyLarge?.copyWith(
              color: value == null
                  ? Colors.red
                  : value == true
                      ? Colors.blue
                      : Colors.red,
            ),
          ),
        ),
        Switch(
          value: value ?? false,
          onChanged: (newValue) {
            widget.onChanged(newValue);
            setState(() {
              value = newValue;
              isNull = false;
            });
          },
        ),
        if (widget.isNullable)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: NullableButton(
              isNull: isNull,
              onPressed: () {
                widget.onChanged(null);
                FocusScope.of(context).unfocus();
                setState(() {
                  value = null;
                  isNull = true;
                });
              },
            ),
          ),
      ],
    );
  }
}
