import 'package:flutter/services.dart';

/// This formatter is used to prevent the user from entering not number characters
/// and to allow negative numbers.

final _intRegex = RegExp(r'^((\-)|(\-\d+)|(\d+))$');

class IntInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    if (!_intRegex.hasMatch(newValue.text)) {
      return oldValue;
    }

    return TextEditingValue(text: newValue.text);
  }
}
