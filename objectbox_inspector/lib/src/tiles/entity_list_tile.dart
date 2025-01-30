import 'package:flutter/material.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'package:objectbox_inspector/src/tiles/property_row.dart';

class EntityListTile extends StatelessWidget {
  final InspectableEntity entity;
  final bool isSelected;
  const EntityListTile({
    super.key,
    required this.entity,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 4,
        top: 4,
      ),
      child: Card(
        elevation: 2,
        color: isSelected ? Colors.blue.shade50 : null,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final property in entity.properties)
                PropertyRow(property: property),
            ],
          ),
        ),
      ),
    );
  }
}
