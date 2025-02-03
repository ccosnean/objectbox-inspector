import 'package:flutter/material.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'package:objectbox_inspector/src/tiles/property_row.dart';

class EntityListTile extends StatefulWidget {
  final InspectableEntity entity;
  final bool isSelected;
  const EntityListTile({
    super.key,
    required this.entity,
    required this.isSelected,
  });

  @override
  State<EntityListTile> createState() => _EntityListTileState();
}

class _EntityListTileState extends State<EntityListTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final props = isExpanded
        ? widget.entity.properties
        : widget.entity.properties.take(2).toList();
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 4,
        top: 4,
      ),
      child: Card(
        elevation: 2,
        color: widget.isSelected ? cs.surfaceContainerHighest : null,
        child: Material(
          color: Colors.transparent,
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final property in props) PropertyRow(property: property),
                  if (!isExpanded)
                    Center(
                      child: Transform.translate(
                        offset: const Offset(0, -4),
                        child: Text(
                          '...',
                          style: tt.titleLarge,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
