import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'package:objectbox_inspector/src/box/edit/edit_property.dart';
import 'package:objectbox_inspector/src/box/tiles/property_value.dart';

class PropertyRow extends StatefulWidget {
  final InspectableProperty property;
  const PropertyRow({
    super.key,
    required this.property,
  });

  @override
  State<PropertyRow> createState() => _PropertyRowState();
}

class _PropertyRowState extends State<PropertyRow> {
  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    final isRelation = widget.property.toOneRelation != null ||
        widget.property.toManyRelation != null;
    final isEditable = widget.property.onChanged != null;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: InkWell(
          onTap: isEditable
              ? () async {
                  if (!isRelation) {
                    final result = await editProperty(context, widget.property);

                    if (result.wasChanged) {
                      setState(() {
                        widget.property.value = result.value;
                      });

                      widget.property.onChanged?.call(result.value);
                    }
                  }
                }
              : null,
          child: Container(
            decoration: BoxDecoration(
              color: cs.onSurface.withOpacity(0.05),
            ),
            padding: const EdgeInsets.only(
              left: 12,
              top: 8,
              bottom: 8,
              right: 0,
            ),
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.property.name,
                        style: tt.bodyLarge,
                      ),
                      PropertyValue(
                        property: widget.property,
                      ),
                    ],
                  ),
                ),
                if (!isEditable)
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12,
                      right: !isRelation ? 0 : 12,
                    ),
                    child: const Icon(
                      Icons.edit_off,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                if (!isRelation)
                  IconButton(
                    onPressed: () {
                      final name = widget.property.name;
                      final value = widget.property.value.toString();
                      final copyString = '$name:$value';
                      ScaffoldMessenger.of(context).clearSnackBars();
                      Clipboard.setData(ClipboardData(text: value));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '"$copyString" -> Copied',
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.content_copy,
                      size: 16,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
