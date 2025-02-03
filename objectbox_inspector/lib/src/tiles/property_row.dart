import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final cs = Theme.of(context).colorScheme;
    final isRelation =
        property.toOneRelation != null || property.toManyRelation != null;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: cs.onSurface.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.only(
        left: 12,
        top: 8,
        bottom: 8,
        right: 0,
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(
        children: [
          Expanded(
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
          ),
          // if (!isRelation) const SizedBox(width: 12),
          // if (!isRelation)
          //   IconButton(
          //     onPressed: () {
          //       final value = property.value.toString();
          //       ScaffoldMessenger.of(context).clearSnackBars();
          //       Clipboard.setData(ClipboardData(text: value));
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //           content: Text(
          //             '"$value" -> Copied',
          //           ),
          //         ),
          //       );
          //     },
          //     icon: const Icon(
          //       Icons.content_copy,
          //       size: 16,
          //     ),
          //   ),
        ],
      ),
    );
  }
}
