import 'package:flutter/material.dart';
import 'package:objectbox_inspector/src/models/inspectable_box.dart';
import 'package:objectbox_inspector/src/tiles/entity_list_tile.dart';

class BoxPage extends StatelessWidget {
  final InspectableBox box;
  final List<int> selectedIds;
  const BoxPage({
    super.key,
    required this.box,
    this.selectedIds = const [],
  });

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final entities = box.entityGetter.call();
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          box.boxName,
          style: tt.titleLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(
          bottom: mq.viewPadding.bottom + 20,
        ),
        itemBuilder: (context, index) {
          final entity = entities[index];

          return EntityListTile(
            entity: entity,
            isSelected: selectedIds.contains(entity.id),
          );
        },
        itemCount: entities.length,
      ),
    );
  }
}
