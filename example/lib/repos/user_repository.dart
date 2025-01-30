import 'package:example/models/user.dart';
import 'package:example/objectbox.g.dart';

class UserRepository {
  final Store _store;
  late final Box<User> box;

  UserRepository(this._store) {
    box = _store.box<User>();
  }

  // Create
  int create(User user) {
    return box.put(user);
  }

  // Read
  User? getById(int id) {
    return box.get(id);
  }

  User? getByEmail(String email) {
    return box.query(User_.email.equals(email)).build().findFirst();
  }

  List<User> getAll() {
    return box.getAll();
  }

  bool deleteAll() {
    return box.removeAll() > 0;
  }
}
