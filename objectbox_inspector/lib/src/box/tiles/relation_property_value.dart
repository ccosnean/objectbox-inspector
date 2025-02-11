import 'package:flutter/material.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';

class ToOneRelationshipPropertyValue extends StatelessWidget {
  final ToOneRelation relation;
  final VoidCallback onTap;

  const ToOneRelationshipPropertyValue({
    super.key,
    required this.relation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: cs.primaryContainer,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    relation.previewString,
                    style: tt.bodyMedium?.copyWith(
                      color: cs.primary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.link,
                    size: 16,
                    color: cs.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ToManyRelationshipPropertyValue extends StatelessWidget {
  final ToManyRelation relation;
  final VoidCallback onTap;

  const ToManyRelationshipPropertyValue({
    super.key,
    required this.relation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: cs.primaryContainer,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    relation.previewString,
                    style: tt.bodyMedium?.copyWith(
                      color: cs.primary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.link,
                    size: 16,
                    color: cs.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
