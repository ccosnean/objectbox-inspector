import 'package:flutter/material.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'package:objectbox_inspector/src/tiles/property_value.dart';

class PropertyRow extends StatelessWidget {
  final InspectableProperty property;
  const PropertyRow({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "${property.name}:",
          style: tt.titleMedium,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 1),
            child: PropertyValue(
              property: property,
            ),
          ),
        ),
      ],
    );
  }
}
