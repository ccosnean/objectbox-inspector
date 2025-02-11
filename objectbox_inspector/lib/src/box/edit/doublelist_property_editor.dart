import 'package:flutter/material.dart';
import 'package:objectbox_inspector/src/box/edit/double_property_editor.dart';
import 'package:objectbox_inspector/src/box/edit/buttons/nullable_button.dart';

class DoublelistPropertyEditor extends StatefulWidget {
  final List<double>? initialValue;
  final ValueChanged<List<double>?> onChanged;
  final bool isNullable;

  const DoublelistPropertyEditor({
    super.key,
    this.initialValue,
    this.isNullable = false,
    required this.onChanged,
  });

  @override
  State<DoublelistPropertyEditor> createState() =>
      _DoublelistPropertyEditorState();
}

class _DoublelistPropertyEditorState extends State<DoublelistPropertyEditor> {
  List<double> values = [];
  final textController = TextEditingController();
  bool isNull = false;
  @override
  void initState() {
    super.initState();

    values = [
      ...widget.initialValue ?? [],
    ];

    isNull = widget.initialValue == null;
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        DoublePropertyEditor(
          initialValue: null,
          onChanged: (_) {},
          autofocus: false,
          hintText: 'Add new item',
          onSubmitted: (newValue) {
            setState(() {
              values.add(newValue!);
              isNull = false;
            });

            widget.onChanged(values);
          },
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 0,
          children: values
              .map(
                (item) => Chip(
                  label: Text(
                    item.toString(),
                    style: tt.bodyMedium,
                  ),
                  deleteIcon: Icon(
                    Icons.delete,
                    color: cs.error,
                  ),
                  onDeleted: () {
                    setState(() {
                      values.remove(item);
                    });

                    widget.onChanged(values);
                  },
                ),
              )
              .toList(),
        ),
        if (widget.isNullable)
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            child: NullableButton(
              isNull: isNull,
              onPressed: () {
                textController.clear();
                FocusScope.of(context).unfocus();
                setState(() {
                  values.clear();
                  isNull = true;
                });
                widget.onChanged(null);
              },
            ),
          ),
      ],
    );
  }
}
