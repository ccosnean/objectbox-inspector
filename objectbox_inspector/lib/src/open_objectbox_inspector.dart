import 'package:flutter/material.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'package:objectbox_inspector/src/box_page_navigator.dart';

/// Opens the ObjectBox Inspector page to visualize and inspect ObjectBox entities.
///
/// The [context] is used to push the inspector page onto the navigation stack.
///
/// The [boxes] parameter takes a list of [InspectableBox] objects that contain
/// the entity data to display. These boxes are typically generated using the
/// `getInspectableBoxes()` function from the objectbox.inspector.g.dart file.
///
/// Example usage:
/// ```dart
/// final store = openStore();
///
/// IconButton(
///   onPressed: () => openObjectboxInspector(
///     context,
///     getInspectableBoxes(store),
///   ),
///   icon: const Icon(Icons.bug_report),
/// )
/// ```
void openObjectboxInspector(
  BuildContext context,
  List<InspectableBox> boxes,
) {
  BoxPageNavigator.setup(boxes);

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ObjectboxInspectorPage(
        boxes: boxes,
      ),
    ),
  );
}
