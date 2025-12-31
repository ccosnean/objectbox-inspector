// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:objectbox/objectbox.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'models/category.dart';
import 'models/comment.dart';
import 'models/post.dart';
import 'models/shape.dart';
import 'models/user.dart';
import 'dart:typed_data';

List<InspectableBox> getInspectableBoxes(Store store) {
  return [
    buildCategoryInspectableBox(store),
    buildCommentInspectableBox(store),
    buildPostInspectableBox(store),
    buildShapeInspectableBox(store),
    buildUserInspectableBox(store),
  ];
}

InspectableBox buildCategoryInspectableBox(Store store) {
  final box = store.box<Category>();
  final allEntities = box.getAll();
  final entities = allEntities
      .map(
        (entity) => InspectableEntity(
          id: entity.dbId,
          properties: [
            InspectableProperty<int>(name: 'dbId', value: entity.dbId),
            InspectableProperty<String>(
              name: 'name',
              value: entity.name,

              onChanged: (value) {
                entity.name = value;
                box.put(entity);
              },
            ),
            InspectableProperty<String?>(
              name: 'description',
              value: entity.description,

              onChanged: (value) {
                entity.description = value;
                box.put(entity);
              },
            ),
            InspectableProperty<String?>(
              name: 'iconName',
              value: entity.iconName,

              onChanged: (value) {
                entity.iconName = value;
                box.put(entity);
              },
            ),
            InspectableProperty<bool>(
              name: 'boolProperty',
              value: entity.boolProperty,

              onChanged: (value) {
                entity.boolProperty = value;
                box.put(entity);
              },
            ),
            InspectableProperty<bool?>(
              name: 'nullableBoolProperty',
              value: entity.nullableBoolProperty,

              onChanged: (value) {
                entity.nullableBoolProperty = value;
                box.put(entity);
              },
            ),
            InspectableProperty<int>(
              name: 'amountOfItems',
              value: entity.amountOfItems,

              onChanged: (value) {
                entity.amountOfItems = value;
                box.put(entity);
              },
            ),
            InspectableProperty<int?>(
              name: 'nullableAmountOfItems',
              value: entity.nullableAmountOfItems,

              onChanged: (value) {
                entity.nullableAmountOfItems = value;
                box.put(entity);
              },
            ),
            InspectableProperty<int>(
              name: 'nonEditableProperty',
              value: entity.nonEditableProperty,
            ),
            InspectableProperty<double>(
              name: 'doubleProperty',
              value: entity.doubleProperty,

              onChanged: (value) {
                entity.doubleProperty = value;
                box.put(entity);
              },
            ),
            InspectableProperty<double?>(
              name: 'nullableDoubleProperty',
              value: entity.nullableDoubleProperty,

              onChanged: (value) {
                entity.nullableDoubleProperty = value;
                box.put(entity);
              },
            ),
            InspectableProperty<List<String>>(
              name: 'stringListProperty',
              value: entity.stringListProperty,

              onChanged: (value) {
                entity.stringListProperty = value;
                box.put(entity);
              },
            ),
            InspectableProperty<List<String>?>(
              name: 'nullableStringListProperty',
              value: entity.nullableStringListProperty,

              onChanged: (value) {
                entity.nullableStringListProperty = value;
                box.put(entity);
              },
            ),
            InspectableProperty<List<int>>(
              name: 'intListProperty',
              value: entity.intListProperty,

              onChanged: (value) {
                entity.intListProperty = value;
                box.put(entity);
              },
            ),
            InspectableProperty<List<int>?>(
              name: 'nullableIntListProperty',
              value: entity.nullableIntListProperty,

              onChanged: (value) {
                entity.nullableIntListProperty = value;
                box.put(entity);
              },
            ),
            InspectableProperty<List<double>>(
              name: 'doubleListProperty',
              value: entity.doubleListProperty,

              onChanged: (value) {
                entity.doubleListProperty = value;
                box.put(entity);
              },
            ),
            InspectableProperty<List<double>?>(
              name: 'optionalDoubleListProperty',
              value: entity.optionalDoubleListProperty,

              onChanged: (value) {
                entity.optionalDoubleListProperty = value;
                box.put(entity);
              },
            ),
            InspectableProperty<Int8List?>(
              name: 'int8ListProperty',
              value: entity.int8ListProperty,

              onChanged: (value) {
                entity.int8ListProperty = value;
                box.put(entity);
              },
            ),
            InspectableProperty<Uint8List?>(
              name: 'uint8ListProperty',
              value: entity.uint8ListProperty,

              onChanged: (value) {
                entity.uint8ListProperty = value;
                box.put(entity);
              },
            ),
            InspectableProperty<Int16List?>(
              name: 'int16ListProperty',
              value: entity.int16ListProperty,

              onChanged: (value) {
                entity.int16ListProperty = value;
                box.put(entity);
              },
            ),
            InspectableProperty<Uint16List?>(
              name: 'uint16ListProperty',
              value: entity.uint16ListProperty,

              onChanged: (value) {
                entity.uint16ListProperty = value;
                box.put(entity);
              },
            ),
            InspectableProperty<Int32List?>(
              name: 'int32ListProperty',
              value: entity.int32ListProperty,

              onChanged: (value) {
                entity.int32ListProperty = value;
                box.put(entity);
              },
            ),
            InspectableProperty<Uint32List?>(
              name: 'uint32ListProperty',
              value: entity.uint32ListProperty,

              onChanged: (value) {
                entity.uint32ListProperty = value;
                box.put(entity);
              },
            ),
            InspectableProperty<Int64List?>(
              name: 'int64ListProperty',
              value: entity.int64ListProperty,

              onChanged: (value) {
                entity.int64ListProperty = value;
                box.put(entity);
              },
            ),
          ],
        ),
      )
      .toList();

  return InspectableBox(
    boxName: 'Category',
    maxEntities: box.count(),
    entityGetter: () => entities,
  );
}

InspectableBox buildCommentInspectableBox(Store store) {
  final box = store.box<Comment>();
  final allEntities = box.getAll();
  final entities = allEntities
      .map(
        (entity) => InspectableEntity(
          id: entity.id,
          properties: [
            InspectableProperty<int>(name: 'id', value: entity.id),
            InspectableProperty<String>(
              name: 'content',
              value: entity.content,

              onChanged: (value) {
                entity.content = value;
                box.put(entity);
              },
            ),
            InspectableProperty<DateTime>(
              name: 'createdAt',
              value: entity.createdAt,

              onChanged: (value) {
                entity.createdAt = value;
                box.put(entity);
              },
            ),
            InspectableProperty(
              name: 'author',
              toOneRelation: ToOneRelation<User>(rel: entity.author),
            ),

            InspectableProperty(
              name: 'post',
              toOneRelation: ToOneRelation<Post>(rel: entity.post),
            ),
          ],
        ),
      )
      .toList();

  return InspectableBox(
    boxName: 'Comment',
    maxEntities: box.count(),
    entityGetter: () => entities,
  );
}

InspectableBox buildPostInspectableBox(Store store) {
  final box = store.box<Post>();
  final allEntities = box.getAll();
  final entities = allEntities
      .map(
        (entity) => InspectableEntity(
          id: entity.id,
          properties: [
            InspectableProperty<int>(name: 'id', value: entity.id),
            InspectableProperty<String>(
              name: 'title',
              value: entity.title,

              onChanged: (value) {
                entity.title = value;
                box.put(entity);
              },
            ),
            InspectableProperty<String>(
              name: 'content',
              value: entity.content,

              onChanged: (value) {
                entity.content = value;
                box.put(entity);
              },
            ),
            InspectableProperty<DateTime>(
              name: 'createdAt',
              value: entity.createdAt,

              onChanged: (value) {
                entity.createdAt = value;
                box.put(entity);
              },
            ),
            InspectableProperty<DateTime?>(
              name: 'updatedAt',
              value: entity.updatedAt,

              onChanged: (value) {
                entity.updatedAt = value;
                box.put(entity);
              },
            ),
            InspectableProperty(
              name: 'author',
              toOneRelation: ToOneRelation<User>(rel: entity.author),
            ),

            InspectableProperty(
              name: 'comments',
              toManyRelation: ToManyRelation<Comment>(
                rel: entity.comments,
                ids: entity.comments.map((e) => e.id).toList(),
              ),
            ),
          ],
        ),
      )
      .toList();

  return InspectableBox(
    boxName: 'Post',
    maxEntities: box.count(),
    entityGetter: () => entities,
  );
}

InspectableBox buildShapeInspectableBox(Store store) {
  final box = store.box<Shape>();
  final allEntities = box.getAll();
  final entities = allEntities
      .map(
        (entity) => InspectableEntity(
          id: entity.dbId,
          properties: [
            InspectableProperty<int>(name: 'dbId', value: entity.dbId),
            InspectableProperty<String>(
              name: 'name',
              value: entity.name,

              onChanged: (value) {
                entity.name = value;
                box.put(entity);
              },
            ),
          ],
        ),
      )
      .toList();

  return InspectableBox(
    boxName: 'Shape',
    maxEntities: box.count(),
    entityGetter: () => entities,
  );
}

InspectableBox buildUserInspectableBox(Store store) {
  final box = store.box<User>();
  final allEntities = box.getAll();
  final entities = allEntities
      .map(
        (entity) => InspectableEntity(
          id: entity.id,
          properties: [
            InspectableProperty<int>(name: 'id', value: entity.id),
            InspectableProperty<String>(
              name: 'email',
              value: entity.email,

              onChanged: (value) {
                entity.email = value;
                box.put(entity);
              },
            ),
            InspectableProperty<String>(
              name: 'name',
              value: entity.name,

              onChanged: (value) {
                entity.name = value;
                box.put(entity);
              },
            ),
          ],
        ),
      )
      .toList();

  return InspectableBox(
    boxName: 'User',
    maxEntities: box.count(),
    entityGetter: () => entities,
  );
}
