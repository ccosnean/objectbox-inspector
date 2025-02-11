import 'package:flutter/material.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'package:objectbox_inspector/src/box/search/search_page.dart';
import 'package:objectbox_inspector/src/box/tiles/entity_list_tile.dart';
import 'package:objectbox_inspector/src/models/search/inspectable_query.dart';

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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool autoScrolled = false;
  InspectableQuery query = InspectableQuery(conditions: []);
  List<InspectableEntity> entities = [];
  List<InspectableProperty> properties = [];

  @override
  void initState() {
    super.initState();

    properties.addAll(
      widget.box.entityGetter.call().first.properties,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _fetchEntities();

    if (widget.selectedIds.isNotEmpty && !autoScrolled) {
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

        autoScrolled = true;
      });
    }

    super.didChangeDependencies();
  }

  void _fetchEntities() {
    entities = query.execute(widget.box.entityGetter.call());
  }

  void _onQueryChanged(InspectableQuery newQuery) {
    setState(() => query = newQuery);

    print(
      'query changed: ${query.conditions.map(
            (e) => {
              'property': e.property,
              'operation': e.operation,
              'value': e.value,
            },
          ).toList()}',
    );

    _fetchEntities();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          widget.box.boxName,
          style: tt.titleLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: cs.surface,
        actions: [
          if (entities.isNotEmpty || query.conditions.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                },
                icon: query.conditions.isNotEmpty
                    ? Container(
                        decoration: BoxDecoration(
                          color: cs.primaryContainer,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Center(
                            child: Text(
                              query.conditions.length.toString(),
                              style: tt.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: cs.primary,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const Icon(Icons.search),
              ),
            ),
        ],
      ),
      endDrawer: entities.isNotEmpty || query.conditions.isNotEmpty
          ? SearchPage(
              args: SearchPageArgs(
                properties: properties,
                query: query,
                onQueryChanged: _onQueryChanged,
              ),
            )
          : null,
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
