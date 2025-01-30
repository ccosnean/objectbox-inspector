import 'package:flutter/material.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'package:objectbox_inspector/src/box_page_navigator.dart';

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
