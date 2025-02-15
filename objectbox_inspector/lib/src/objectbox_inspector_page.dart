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
class ObjectboxInspectorPage extends StatefulWidget {
  final List<InspectableBox> boxes;

  const ObjectboxInspectorPage({
    super.key,
    required this.boxes,
  });

  @override
  State<ObjectboxInspectorPage> createState() => _ObjectboxInspectorPageState();
}

class _ObjectboxInspectorPageState extends State<ObjectboxInspectorPage> {
  final searchController = TextEditingController();
  var boxes = <InspectableBox>[];
  bool isSearching = false;
  String? searchQuery;

  @override
  void initState() {
    super.initState();
    boxes = widget.boxes;
    searchController.addListener(() {
      setState(() {
        searchQuery = searchController.text.toLowerCase();
        if (searchQuery != null && searchQuery!.isNotEmpty) {
          boxes = widget.boxes
              .where(
                (box) => box.boxName.toLowerCase().contains(searchQuery!),
              )
              .toList();
        } else {
          boxes = widget.boxes;
        }
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverAppBar(
            title: isSearching
                ? TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                        hintText: 'Name contains...',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: cs.outline,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                        isDense: true),
                  )
                : const Text('ObjectBox Inspector'),
            titleSpacing: 0,
            centerTitle: true,
            backgroundColor: cs.surface,
            pinned: true,
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isSearching = !isSearching;
                    if (!isSearching) {
                      searchController.clear();
                    }
                  });
                },
                icon: Icon(
                  isSearching ? Icons.close : Icons.search,
                ),
              ),
            ],
          ),
          SliverList.builder(
            itemCount: boxes.length,
            itemBuilder: (context, index) {
              final box = boxes[index];

              return BoxListTile(
                box: box,
                highlight: searchQuery,
                onTap: () {
                  BoxPageNavigator.push(
                    context,
                    box.boxName,
                  );
                },
              );
            },
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: mq.viewPadding.bottom + 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
