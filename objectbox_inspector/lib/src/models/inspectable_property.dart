import 'package:objectbox/objectbox.dart';

class InspectableProperty {
  final String name;
  final dynamic value;
  final ToOneRelation? toOneRelation;
  final ToManyRelation? toManyRelation;

  InspectableProperty({
    required this.name,
    this.value,
    this.toOneRelation,
    this.toManyRelation,
  });
}

class ToOneRelation<T> {
  final ToOne<T> rel;

  String get previewString {
    final preview = rel.target.toString();

    if (preview.contains("Instance of")) {
      return "ToOne(id: ${rel.targetId})";
    }

    return preview;
  }

  String get targetBoxName => T.toString();

  ToOneRelation({
    required this.rel,
  });
}

class ToManyRelation<T> {
  final ToMany<T> rel;

  String get previewString {
    return "ToMany(count: ${rel.length})";
  }

  String get targetBoxName => T.toString();

  ToManyRelation({
    required this.rel,
  });
}
