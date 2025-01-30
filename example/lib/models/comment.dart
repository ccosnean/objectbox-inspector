import 'package:objectbox/objectbox.dart';
import 'user.dart';
import 'post.dart';

@Entity()
class Comment {
  int id;

  String content;

  @Property(type: PropertyType.date)
  DateTime createdAt;

  // Relation to User (many-to-one)
  final author = ToOne<User>();

  // Relation to Post (many-to-one)
  final post = ToOne<Post>();

  Comment({
    required this.content,
  })  : id = 0,
        createdAt = DateTime.now();
}
