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

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.only(
        left: 14,
        top: 10,
        bottom: 10,
        right: 14,
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            property.name,
            style: tt.bodyLarge,
          ),
          PropertyValue(
            property: property,
          ),
        ],
      ),
    );
  }
}
