import 'package:flutter/material.dart';
import 'package:objectbox_inspector/src/box/search/input_formatters/double_input_formatter.dart';

class DoubleTextField extends StatelessWidget {
  final double? initialValue;
  final void Function(double?) onChanged;

  const DoubleTextField({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const ValueKey("double"),
      initialValue: initialValue?.toString(),
      decoration: const InputDecoration(
        hintText: 'Double Value',
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: InputBorder.none,
      ),
      keyboardType: const TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      ),
      onChanged: (value) {
        onChanged(double.tryParse(value));
      },
      inputFormatters: [
        DoubleInputFormatter(),
      ],
    );
  }
}
