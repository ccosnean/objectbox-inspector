import 'package:flutter/material.dart';

class StringTextField extends StatelessWidget {
  final String? initialValue;
  final void Function(String) onChanged;
  const StringTextField({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const ValueKey("String"),
      initialValue: initialValue,
      decoration: const InputDecoration(
        hintText: 'String Value',
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: InputBorder.none,
      ),
      onChanged: onChanged,
    );
  }
}
