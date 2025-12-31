import 'package:example/models/shape.dart';
import 'package:example/objectbox.g.dart';

class ShapesRepository {
  final Store _store;
  late final Box<Shape> box;

  ShapesRepository(this._store) {
    box = _store.box<Shape>();
  }

  // Create
  int create(Shape shape) {
    return box.put(shape);
  }

  // Read
  Shape? getById(int id) {
    return box.get(id);
  }

  Shape? getByName(String name) {
    return box.query(Shape_.name.equals(name)).build().findFirst();
  }

  List<Shape> getAll() {
    return box.getAll();
  }

  bool deleteAll() {
    return box.removeAll() > 0;
  }
}
