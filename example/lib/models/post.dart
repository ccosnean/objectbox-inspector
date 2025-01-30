import 'package:example/models/comment.dart';
import 'package:objectbox/objectbox.dart';
import 'user.dart';

@Entity()
class Post {
  int id;

  String title;
  String content;

  @Property(type: PropertyType.date)
  DateTime createdAt;

  @Property(type: PropertyType.date)
  DateTime? updatedAt;

  final author = ToOne<User>();

  @Backlink('post')
  final comments = ToMany<Comment>();

  Post({
    required this.title,
    required this.content,
  })  : id = 0,
        createdAt = DateTime.now();
}
