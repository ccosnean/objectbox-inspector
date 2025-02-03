import 'package:flutter/material.dart';

class NullableButton extends StatelessWidget {
  final bool isNull;
  final VoidCallback onPressed;

  const NullableButton({
    super.key,
    required this.isNull,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Opacity(
      opacity: isNull ? 0.6 : 1,
      child: Material(
        color: cs.errorContainer,
        borderRadius: BorderRadius.circular(12),
        child: IconButton(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          onPressed: onPressed,
          icon: Icon(
            Icons.delete,
            color: cs.error,
          ),
        ),
      ),
    );
  }
}
