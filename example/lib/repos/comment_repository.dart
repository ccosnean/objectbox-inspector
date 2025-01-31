import 'package:example/models/comment.dart';
import 'package:example/objectbox.g.dart';

class CommentRepository {
  final Store _store;
  late final Box<Comment> box;

  CommentRepository(this._store) {
    box = _store.box<Comment>();
  }

  // Create
  int create(Comment comment) {
    return box.put(comment);
  }

  // Read
  Comment? getById(int id) {
    return box.get(id);
  }

  List<Comment> getAll() {
    return box.getAll();
  }

  List<Comment> getByPostId(int postId) {
    return box.query(Comment_.post.equals(postId)).build().find();
  }

  List<Comment> getByUserId(int userId) {
    return box.query(Comment_.author.equals(userId)).build().find();
  }

  // Update
  bool update(Comment comment) {
    return box.put(comment) > 0;
  }

  // Delete
  bool delete(int id) {
    return box.remove(id);
  }

  bool deleteAll() {
    return box.removeAll() > 0;
  }
}
