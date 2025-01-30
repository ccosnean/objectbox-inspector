import 'package:example/models/category.dart';
import 'package:example/objectbox.g.dart';

class CategoryRepository {
  final Store _store;
  late final Box<Category> box;

  CategoryRepository(this._store) {
    box = _store.box<Category>();
  }

  // Create
  int create(Category category) {
    return box.put(category);
  }

  // Read
  Category? getById(int id) {
    return box.get(id);
  }

  Category? getByName(String name) {
    return box.query(Category_.name.equals(name)).build().findFirst();
  }

  List<Category> getAll() {
    return box.getAll();
  }

  // Update
  bool update(Category category) {
    return box.put(category) > 0;
  }

  // Delete
  bool delete(int id) {
    return box.remove(id);
  }

  bool deleteAll() {
    return box.removeAll() > 0;
  }
}
