// ignore_for_file: depend_on_referenced_packages

import 'package:example/objectbox.g.dart';
import 'package:example/repos/shapes_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'user_repository.dart';
import 'category_repository.dart';
import 'comment_repository.dart';
import 'post_repository.dart';

class Repos {
  static Repos? _instance;
  late final Store store;

  // Repositories
  late final PostRepository posts;
  late final CommentRepository comments;
  late final CategoryRepository categories;
  late final UserRepository users;
  late final ShapesRepository shapes;

  // Private constructor
  Repos._();

  static Future<Repos> initialize() async {
    if (_instance != null) return _instance!;

    // Get the application documents directory
    final dir = await getApplicationDocumentsDirectory();
    // Create a specific directory for your database
    final dbPath = p.join(dir.path, "objectbox");

    // Create singleton instance
    _instance = Repos._();

    // Initialize store with the path
    _instance!.store = await openStore(directory: dbPath);

    // Initialize repositories
    _instance!.posts = PostRepository(_instance!.store);
    _instance!.comments = CommentRepository(_instance!.store);
    _instance!.categories = CategoryRepository(_instance!.store);
    _instance!.users = UserRepository(_instance!.store);
    _instance!.shapes = ShapesRepository(_instance!.store);

    return _instance!;
  }

  static Repos get instance {
    if (_instance == null) {
      throw StateError('Repos not initialized. Call Repos.initialize() first.');
    }
    return _instance!;
  }

  // Clean up resources
  static Future<void> dispose() async {
    _instance!.store.close();
    _instance = null;
  }
}
