import 'package:objectbox/objectbox.dart';

@Entity()
class Shape {
  @Id()
  int dbId;

  String name;

  Shape({required this.name}) : dbId = 0;
}
