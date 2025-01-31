import 'package:flutter/material.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'package:objectbox_inspector/src/tiles/entity_list_tile.dart';

/// A page that displays the entities within a specific ObjectBox box.
///
/// The [BoxPage] takes an [InspectableBox] and displays its entities in a list.
/// Each entity is shown as a list tile that can be expanded to view its properties.
///
/// The [selectedIds] parameter can be used to highlight specific entities and
/// automatically scroll to the first selected entity when the page loads.
///
/// Example usage:
/// ```dart
/// BoxPage(
///   box: myInspectableBox,
///   selectedIds: [1, 2, 3],
/// )
/// ```
class BoxPage extends StatefulWidget {
  final InspectableBox box;
  final List<int> selectedIds;
  const BoxPage({
    super.key,
    required this.box,
    this.selectedIds = const [],
  });

  @override
  State<BoxPage> createState() => _BoxPageState();
}

class _BoxPageState extends State<BoxPage> {
  final controller = ScrollController();

  List<InspectableEntity> entities = [];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    entities = widget.box.entityGetter.call();
    if (widget.selectedIds.isNotEmpty) {
      final firstSelectedId = widget.selectedIds.first;
      final selectedIdIndex =
          entities.indexWhere((e) => e.id == firstSelectedId);

      WidgetsBinding.instance.waitUntilFirstFrameRasterized.then((_) async {
        final totalHeight = controller.position.maxScrollExtent;
        final entityHeight = totalHeight / (entities.length - 1);
        await controller.animateTo(
          entityHeight * selectedIdIndex,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
        );
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.box.boxName,
          style: tt.titleLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView.builder(
        controller: controller,
        padding: EdgeInsets.only(
          bottom: mq.viewPadding.bottom + 20,
        ),
        itemBuilder: (context, index) {
          final entity = entities[index];
          final isSelected = widget.selectedIds.contains(entity.id);

          return EntityListTile(
            entity: entity,
            isSelected: isSelected,
          );
        },
        itemCount: entities.length,
      ),
    );
  }
}
