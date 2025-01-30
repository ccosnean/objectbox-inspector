import 'package:flutter/material.dart';
import 'package:objectbox_inspector/src/box_page_navigator.dart';
import 'package:objectbox_inspector/src/tiles/box_list_tile.dart';

import 'models/inspectable_box.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Objectbox Inspector',
          style: tt.titleLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
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
