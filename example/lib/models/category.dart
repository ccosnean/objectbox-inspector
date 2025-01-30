import 'package:objectbox/objectbox.dart';

@Entity()
class Category {
  @Id()
  int dbId;

  @Unique()
  String name;

  String? description;
  String? iconName;

  @Transient()
  String testProperty = 'testTransientProperty';

  Category({
    required this.name,
    this.description,
    this.iconName,
  }) : dbId = 0;
}
