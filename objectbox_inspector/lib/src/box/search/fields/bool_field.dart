import 'package:flutter/material.dart';

class BoolField extends StatefulWidget {
  final bool? initialValue;
  final void Function(bool?) onChanged;

  const BoolField({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  @override
  State<BoolField> createState() => _BoolFieldState();
}

class _BoolFieldState extends State<BoolField> {
  bool? value;

  @override
  void initState() {
    super.initState();

    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      expandedInsets: EdgeInsets.zero,
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        side: WidgetStateProperty.all(BorderSide.none),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
      ),
      showSelectedIcon: false,
      segments: const [
        ButtonSegment(value: true, label: Text("True")),
        ButtonSegment(value: false, label: Text("False")),
      ],
      selected: {value ?? false},
      onSelectionChanged: (value) {
        setState(() {
          this.value = value.first;
        });

        widget.onChanged(this.value);
      },
    );
  }
}
