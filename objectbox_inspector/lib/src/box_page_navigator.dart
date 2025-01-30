import 'package:flutter/material.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'package:objectbox_inspector/src/box_page.dart';

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
