import 'package:flutter/material.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'package:objectbox_inspector/src/box/search/condition_row.dart';
import 'package:objectbox_inspector/src/box/search/widgets/and_card.dart';
import 'package:objectbox_inspector/src/models/search/inspectable_condition.dart';
import 'package:objectbox_inspector/src/models/search/inspectable_operation.dart';
import 'package:objectbox_inspector/src/models/search/inspectable_query.dart';

class SearchPageArgs {
  final InspectableQuery query;
  final List<InspectableProperty> properties;
  final ValueChanged<InspectableQuery> onQueryChanged;

  SearchPageArgs({
    required this.query,
    required this.properties,
    required this.onQueryChanged,
  });
}

class SearchPage extends StatefulWidget {
  final SearchPageArgs args;

  const SearchPage({
    super.key,
    required this.args,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<InspectableProperty> properties = [];
  List<InspectableCondition> conditions = [];

  @override
  void initState() {
    conditions = widget.args.query.conditions;
    properties = widget.args.properties;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return SizedBox(
      width: mq.size.width * 0.8,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              const SliverAppBar(
                leading: SizedBox(),
                title: Text('Search'),
              ),
              SliverList.separated(
                itemBuilder: (context, index) {
                  final condition = conditions[index];

                  return ConditionRow(
                    condition: condition,
                    properties: properties,
                    onChanged: (newCondition) {
                      setState(() {
                        conditions[index] = newCondition;
                      });
                      _applyQuery();
                    },
                  );
                },
                separatorBuilder: (_, __) => const AndCard(),
                itemCount: conditions.length,
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 10),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (conditions.isNotEmpty)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            conditions.removeLast();
                          });
                          _applyQuery();
                        },
                        child: Text(
                          'Remove condition',
                          style: tt.bodyMedium?.copyWith(
                            color: cs.error,
                          ),
                        ),
                      ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          conditions.add(
                            InspectableCondition(
                              property: properties.first,
                              operation: InspectableOperation.equal,
                              value: null,
                            ),
                          );
                        });
                        _applyQuery();
                      },
                      child: const Text('Add condition'),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 160),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _applyQuery() {
    widget.args.onQueryChanged(
      InspectableQuery(
        conditions: conditions,
      ),
    );
  }
}
