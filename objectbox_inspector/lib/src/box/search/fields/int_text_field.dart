import 'package:flutter/material.dart';
import 'package:objectbox_inspector/src/box/search/input_formatters/int_input_formatter.dart';

class IntTextField extends StatelessWidget {
  final int? initialValue;
  final void Function(int?) onChanged;

  const IntTextField({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const ValueKey("int"),
      initialValue: initialValue?.toString(),
      decoration: const InputDecoration(
        hintText: 'Int Value',
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: InputBorder.none,
      ),
      keyboardType: const TextInputType.numberWithOptions(
        signed: true,
        decimal: false,
      ),
      onChanged: (value) {
        onChanged(int.tryParse(value));
      },
      inputFormatters: [
        IntInputFormatter(),
      ],
    );
  }
}
