import 'package:example/models/post.dart';
import 'package:example/objectbox.g.dart';

class PostRepository {
  final Store _store;
  late final Box<Post> box;

  PostRepository(this._store) {
    box = _store.box<Post>();
  }

  // Create
  int create(Post post) {
    return box.put(post);
  }

  // Read
  Post? getById(int id) {
    return box.get(id);
  }

  List<Post> getAll() {
    return box.getAll();
  }

  List<Post> getAllByUserId(int userId) {
    return box.query(Post_.author.equals(userId)).build().find();
  }

  // Update
  bool update(Post post) {
    post.updatedAt = DateTime.now();
    return box.put(post) > 0;
  }

  // Delete
  bool delete(int id) {
    return box.remove(id);
  }

  bool deleteAll() {
    return box.removeAll() > 0;
  }
}
