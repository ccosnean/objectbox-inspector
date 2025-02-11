import 'package:flutter/material.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'package:objectbox_inspector/src/box/box_page.dart';

/// A utility class that handles navigation to [BoxPage]s and manages the available boxes.
///
/// The [BoxPageNavigator] maintains a map of box names to [InspectableBox] objects
/// and provides methods to set up the boxes and navigate to specific box pages.
class BoxPageNavigator {
  static Map<String, InspectableBox> _boxes = {};

  static void setup(List<InspectableBox> boxes) {
    _boxes = {
      for (var box in boxes) box.boxName: box,
    };
  }

  static void push(
    BuildContext context,
    String boxName, [
    List<int> selectedIds = const [],
  ]) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BoxPage(
          box: _boxes[boxName]!,
          selectedIds: selectedIds,
        ),
      ),
    );
  }
}
