import 'package:flutter/material.dart';
import 'package:objectbox_inspector/src/box/edit/buttons/nullable_button.dart';

class StringlistPropertyEditor extends StatefulWidget {
  final List<String>? initialValue;
  final ValueChanged<List<String>?> onChanged;
  final bool isNullable;

  const StringlistPropertyEditor({
    super.key,
    this.initialValue,
    required this.onChanged,
    this.isNullable = false,
  });

  @override
  State<StringlistPropertyEditor> createState() =>
      _StringlistPropertyEditorState();
}

class _StringlistPropertyEditorState extends State<StringlistPropertyEditor> {
  List<String> values = [];
  TextEditingController textController = TextEditingController();
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
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Add new item',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  suffixIcon: IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: () {
                      textController.clear();
                    },
                    icon: const Icon(Icons.clear, size: 18),
                  ),
                ),
                onFieldSubmitted: (newValue) {
                  textController.clear();
                  setState(() {
                    values.add(newValue);
                    isNull = false;
                  });

                  widget.onChanged(values);
                },
                controller: textController,
              ),
            ),
            if (widget.isNullable)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: NullableButton(
                  isNull: isNull,
                  onPressed: () {
                    textController.clear();
                    FocusScope.of(context).unfocus();
                    widget.onChanged(null);
                    setState(() {
                      values.clear();
                      isNull = true;
                    });
                  },
                ),
              ),
          ],
        ),
        Wrap(
          spacing: 8,
          runSpacing: 0,
          children: values
              .map(
                (item) => Chip(
                  label: Text(
                    item,
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
      ],
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
