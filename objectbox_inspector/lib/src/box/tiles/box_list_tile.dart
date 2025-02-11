import 'package:flutter/material.dart';
import 'package:objectbox_inspector/src/models/inspectable_box.dart';

class BoxListTile extends StatelessWidget {
  final InspectableBox box;
  final VoidCallback onTap;

  const BoxListTile({
    super.key,
    required this.box,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final boxName = box.boxName;

    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        left: 16,
        right: 16,
        bottom: 4,
      ),
      child: Card(
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$boxName box",
                          style: tt.titleMedium,
                        ),
                        Text(
                          '${box.maxEntities.toString()} items',
                          style: tt.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
