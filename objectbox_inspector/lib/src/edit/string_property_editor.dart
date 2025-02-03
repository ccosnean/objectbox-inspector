import 'package:flutter/material.dart';
import 'package:objectbox_inspector/src/widgets/nullable_button.dart';

class StringPropertyEditor extends StatefulWidget {
  final bool isNullable;
  final String? initialValue;
  final ValueChanged<String?> onChanged;

  const StringPropertyEditor({
    super.key,
    this.initialValue,
    this.isNullable = false,
    required this.onChanged,
  });

  @override
  State<StringPropertyEditor> createState() => _StringPropertyEditorState();
}

class _StringPropertyEditorState extends State<StringPropertyEditor> {
  late TextEditingController textController;
  bool isNull = false;

  @override
  void initState() {
    super.initState();

    textController = TextEditingController(text: widget.initialValue);
    isNull = widget.initialValue == null;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextFormField(
            controller: textController,
            maxLines: 6,
            minLines: 1,
            autofocus: true,
            onChanged: (value) {
              widget.onChanged(value);
              setState(() {
                isNull = false;
              });
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  textController.clear();
                  widget.onChanged('');
                  setState(() {
                    isNull = false;
                  });
                },
                icon: const Icon(Icons.clear),
              ),
            ),
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
                  isNull = true;
                });
              },
            ),
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
