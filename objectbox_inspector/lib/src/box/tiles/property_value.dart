import 'package:flutter/material.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'package:objectbox_inspector/src/box_page_navigator.dart';
import 'package:objectbox_inspector/src/box/tiles/relation_property_value.dart';

class PropertyValue extends StatelessWidget {
  final InspectableProperty property;
  const PropertyValue({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    if (property.toOneRelation != null) {
      return ToOneRelationshipPropertyValue(
        relation: property.toOneRelation!,
        onTap: () {
          BoxPageNavigator.push(
            context,
            property.toOneRelation!.targetBoxName,
            [property.toOneRelation!.rel.targetId],
          );
        },
      );
    }

    if (property.toManyRelation != null) {
      return ToManyRelationshipPropertyValue(
        relation: property.toManyRelation!,
        onTap: () {
          BoxPageNavigator.push(
            context,
            property.toManyRelation!.targetBoxName,
            property.toManyRelation!.ids,
          );
        },
      );
    }

    if (property.value is bool) {
      return BoolPropertyValue(value: property.value as bool);
    }

    if (property.value is int) {
      return IntPropertyValue(value: property.value as int);
    }

    if (property.value is double) {
      return DoublePropertyValue(value: property.value as double);
    }

    if (property.value is String) {
      return StringPropertyValue(value: property.value as String);
    }

    if (property.value is DateTime) {
      return DatePropertyValue(value: property.value as DateTime);
    }

    if (property.value is List) {
      return ListPropertyValue(value: property.value as List);
    }
    if (property.value == null) {
      return const NullPropertyValue();
    }

    return Text(
      property.value.toString(),
      style: tt.bodyLarge,
    );
  }
}

class NullPropertyValue extends StatelessWidget {
  const NullPropertyValue({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Text(
      'null',
      style: tt.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
        color: Colors.redAccent,
      ),
    );
  }
}

class BoolPropertyValue extends StatelessWidget {
  final bool value;
  const BoolPropertyValue({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Text(
      value.toString(),
      style: tt.bodyLarge?.copyWith(
        color: value ? Colors.blue : Colors.red,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class StringPropertyValue extends StatelessWidget {
  final String value;
  const StringPropertyValue({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Text(
      '"$value"',
      style: tt.bodyLarge?.copyWith(
        color: Colors.green.shade700,
      ),
    );
  }
}

class IntPropertyValue extends StatelessWidget {
  final int value;
  const IntPropertyValue({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Text(
      value.toString(),
      style: tt.titleMedium?.copyWith(
        color: Colors.blue,
      ),
    );
  }
}

class DoublePropertyValue extends StatelessWidget {
  final double value;
  const DoublePropertyValue({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Text(
      value.toString(),
      style: tt.titleMedium?.copyWith(
        color: Colors.blue,
      ),
    );
  }
}

class DatePropertyValue extends StatelessWidget {
  final DateTime value;
  const DatePropertyValue({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return Text(
      value.toString(),
      style: tt.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
        color: Colors.purple,
      ),
    );
  }
}

class ListPropertyValue extends StatelessWidget {
  final List<dynamic> value;
  const ListPropertyValue({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    final isString = value.any((e) => e is String);
    final bg = isString ? Colors.green : Colors.blue;

    if (value.isEmpty) {
      return Text(
        '[]',
        style: tt.bodyLarge?.copyWith(
          color: cs.onSurface.withValues(alpha: 0.5),
        ),
      );
    }

    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: value
          .map(
            (e) => Container(
              padding: EdgeInsets.only(
                left: isString ? 6 : 8,
                right: isString ? 6 : 8,
                top: 2,
                bottom: 2,
              ),
              decoration: BoxDecoration(
                color: cs.onSurface.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "${isString ? '"' : ''}${e.toString()}${isString ? '"' : ''}",
                style: tt.bodyLarge?.copyWith(
                  color: bg,
                  fontWeight: isString ? FontWeight.normal : FontWeight.w500,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
