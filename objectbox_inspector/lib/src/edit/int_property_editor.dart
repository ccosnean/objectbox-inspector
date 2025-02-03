import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:objectbox_inspector/src/widgets/nullable_button.dart';

class IntPropertyEditor extends StatefulWidget {
  final int? initialValue;
  final ValueChanged<int?> onChanged;
  final ValueChanged<int?>? onSubmitted;
  final String? hintText;
  final bool autofocus;
  final bool isNullable;

  const IntPropertyEditor({
    super.key,
    this.initialValue,
    required this.onChanged,
    this.onSubmitted,
    this.hintText,
    this.autofocus = true,
    this.isNullable = false,
  });

  @override
  State<IntPropertyEditor> createState() => _IntPropertyEditorState();
}

class _IntPropertyEditorState extends State<IntPropertyEditor> {
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();

  int sign = 1;
  int? value;
  bool isNull = false;

  @override
  void initState() {
    if (widget.initialValue != null && widget.initialValue! < 0) {
      sign = -1;
    }

    if (widget.initialValue != null) {
      value = widget.initialValue!.abs();
      textController.text = value.toString();
    }

    isNull = widget.initialValue == null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Form(
      key: formKey,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Material(
            color: cs.primaryContainer,
            borderRadius: BorderRadius.circular(12),
            child: IconButton(
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
              icon: Icon(
                sign == -1 ? Icons.remove : Icons.add,
                color: cs.primary,
              ),
              onPressed: () {
                setState(() {
                  sign = sign == -1 ? 1 : -1;
                });

                if (value != null) {
                  widget.onChanged(value! * sign);
                }
              },
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: textController,
              maxLines: 6,
              minLines: 1,
              autofocus: widget.autofocus,
              onChanged: (newValue) {
                value = int.tryParse(newValue);

                if (value != null) {
                  widget.onChanged(value! * sign);

                  setState(() {
                    isNull = false;
                  });
                }
              },
              onSaved: (newValue) {
                if (newValue == null) {
                  return;
                }

                value = int.tryParse(newValue);

                if (widget.onSubmitted != null && value != null) {
                  textController.clear();
                  widget.onSubmitted!(value! * sign);

                  setState(() {
                    isNull = false;
                  });
                }
              },
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                signed: false,
                decimal: false,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          if (widget.isNullable)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: NullableButton(
                isNull: isNull,
                onPressed: () {
                  textController.clear();
                  widget.onChanged(null);
                  FocusScope.of(context).unfocus();
                  setState(() {
                    isNull = true;
                  });
                },
              ),
            ),
          if (widget.onSubmitted != null)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Material(
                color: cs.primaryContainer,
                borderRadius: BorderRadius.circular(12),
                child: IconButton(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.save,
                    color: cs.primary,
                  ),
                  onPressed: () {
                    formKey.currentState?.save();
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
