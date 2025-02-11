import 'package:flutter/material.dart';
import 'package:objectbox_inspector/src/box_page_navigator.dart';
import 'package:objectbox_inspector/src/box/tiles/box_list_tile.dart';

import 'models/inspectable_box.dart';

/// A page that displays a list of ObjectBox boxes and their entities for inspection.
///
/// The [ObjectboxInspectorPage] takes a list of [InspectableBox] objects that contain
/// the entity data to display. Each box is shown as a list tile that can be tapped
/// to view the entities within that box.
///
/// The boxes are typically generated using the `getInspectableBoxes()` function from
/// the objectbox.inspector.g.dart file.
///
/// Example usage:
/// ```dart
/// Navigator.push(
///   context,
///   MaterialPageRoute(
///     builder: (context) => ObjectboxInspectorPage(
///       boxes: getInspectableBoxes(store),
///     ),
///   ),
/// );
/// ```
class ObjectboxInspectorPage extends StatelessWidget {
  final List<InspectableBox> boxes;

  const ObjectboxInspectorPage({
    super.key,
    required this.boxes,
  });

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Objectbox Inspector',
          style: tt.titleLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: cs.surface,
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(
          bottom: mq.viewPadding.bottom + 20,
        ),
        itemCount: boxes.length,
        itemBuilder: (context, index) {
          final box = boxes[index];

          return BoxListTile(
            box: box,
            onTap: () {
              BoxPageNavigator.push(
                context,
                box.boxName,
              );
            },
          );
        },
      ),
    );
  }
}
