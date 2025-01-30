import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  int id;

  @Unique()
  String email;

  String name;

  User({
    required this.email,
    required this.name,
  }) : id = 0;

  @override
  String toString() => name;
}
