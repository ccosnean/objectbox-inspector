import 'package:flutter/material.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'package:objectbox_inspector/src/box/tiles/property_row.dart';

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
        : widget.entity.properties.sublist(1).take(1).toList();
    if (props.isEmpty) {
      props.add(widget.entity.properties.first);
    }
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
        child: Material(
          color: Colors.transparent,
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: widget.isSelected
                      ? cs.primaryContainer
                      : cs.onSurface.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                margin: const EdgeInsets.only(
                  top: 0,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        Text(
                          "ID: ",
                          style: tt.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.entity.id.toString(),
                            style: tt.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        Icon(
                          isExpanded ? Icons.expand_less : Icons.expand_more,
                          color: cs.onSurface,
                        ),
                        const SizedBox(width: 12),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 6,
                  right: 6,
                  bottom: 2,
                  top: 2,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (final property in props)
                      PropertyRow(property: property),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
