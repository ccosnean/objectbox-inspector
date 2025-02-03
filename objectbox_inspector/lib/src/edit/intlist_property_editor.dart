import 'package:flutter/material.dart';
import 'package:objectbox_inspector/src/edit/int_property_editor.dart';
import 'package:objectbox_inspector/src/widgets/nullable_button.dart';

class IntlistPropertyEditor extends StatefulWidget {
  final List<int>? initialValue;
  final ValueChanged<List<int>?> onChanged;
  final bool isNullable;

  const IntlistPropertyEditor({
    super.key,
    this.initialValue,
    this.isNullable = false,
    required this.onChanged,
  });

  @override
  State<IntlistPropertyEditor> createState() => _IntlistPropertyEditorState();
}

class _IntlistPropertyEditorState extends State<IntlistPropertyEditor> {
  List<int> values = [];
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
        IntPropertyEditor(
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
                      isNull = false;
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
