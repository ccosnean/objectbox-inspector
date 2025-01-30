// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:objectbox/objectbox.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';
import 'models/category.dart';
import 'models/post.dart';
import 'models/comment.dart';
import 'models/user.dart';

List<InspectableBox> getInspectableBoxes(Store store) {
  return [
    buildCategoryInspectableBox(store),
    buildPostInspectableBox(store),
    buildCommentInspectableBox(store),
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
            InspectableProperty(
              name: 'dbId',
              value: entity.dbId,
            ),
            InspectableProperty(
              name: 'name',
              value: entity.name,
            ),
            InspectableProperty(
              name: 'description',
              value: entity.description,
            ),
            InspectableProperty(
              name: 'iconName',
              value: entity.iconName,
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

InspectableBox buildPostInspectableBox(Store store) {
  final box = store.box<Post>();
  final allEntities = box.getAll();
  final entities = allEntities
      .map(
        (entity) => InspectableEntity(
          id: entity.id,
          properties: [
            InspectableProperty(
              name: 'id',
              value: entity.id,
            ),
            InspectableProperty(
              name: 'title',
              value: entity.title,
            ),
            InspectableProperty(
              name: 'content',
              value: entity.content,
            ),
            InspectableProperty(
              name: 'createdAt',
              value: entity.createdAt,
            ),
            InspectableProperty(
              name: 'updatedAt',
              value: entity.updatedAt,
            ),
            InspectableProperty(
              name: 'author',
              toOneRelation: ToOneRelation<User>(rel: entity.author),
            ),
            InspectableProperty(
              name: 'comments',
              toManyRelation: ToManyRelation<Comment>(rel: entity.comments),
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

InspectableBox buildCommentInspectableBox(Store store) {
  final box = store.box<Comment>();
  final allEntities = box.getAll();
  final entities = allEntities
      .map(
        (entity) => InspectableEntity(
          id: entity.id,
          properties: [
            InspectableProperty(
              name: 'id',
              value: entity.id,
            ),
            InspectableProperty(
              name: 'content',
              value: entity.content,
            ),
            InspectableProperty(
              name: 'createdAt',
              value: entity.createdAt,
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

InspectableBox buildUserInspectableBox(Store store) {
  final box = store.box<User>();
  final allEntities = box.getAll();
  final entities = allEntities
      .map(
        (entity) => InspectableEntity(
          id: entity.id,
          properties: [
            InspectableProperty(
              name: 'id',
              value: entity.id,
            ),
            InspectableProperty(
              name: 'email',
              value: entity.email,
            ),
            InspectableProperty(
              name: 'name',
              value: entity.name,
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
