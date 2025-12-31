import 'dart:typed_data';

import 'package:example/models/user.dart';
import 'package:example/models/post.dart';
import 'package:example/models/comment.dart';
import 'package:example/models/category.dart';
import 'package:example/repos/repos.dart';

class DatabaseSeeder {
  static Future<void> seed() async {
    // Repos.instance.users.deleteAll();
    // Repos.instance.posts.deleteAll();
    // Repos.instance.comments.deleteAll();
    // Repos.instance.categories.deleteAll();
    // return;
    if (Repos.instance.users.getAll().isNotEmpty) {
      return;
    }

    await _seedCategories();
    await _seedUsers();
    await _seedPosts();
    await _seedComments();
    await _seedShapes();
  }

  static Future<void> _seedCategories() async {
    Repos.instance.categories.create(
      Category(
        name: 'Category 1',
        int8ListProperty: Int8List.fromList([1, 2, 3]),
        uint8ListProperty: Uint8List.fromList([1, 2, 3]),
        int16ListProperty: Int16List.fromList([1, 2, 3]),
        uint16ListProperty: Uint16List.fromList([1, 2, 3]),
        int32ListProperty: Int32List.fromList([1, 2, 3]),
        uint32ListProperty: Uint32List.fromList([1, 2, 3]),
        int64ListProperty: Int64List.fromList([1, 2, 3]),
      ),
    );
    for (int index = 1; index < 100; index++) {
      final category = Category(
        name: 'Category $index',
        description: 'Description $index',
        iconName: 'icon_$index',
        amountOfItems: index,
        nonEditableProperty: index * 100,
        stringListProperty: List.generate(5, (i) => 'string$i'),
        intListProperty: List.generate(5, (i) => i),
        doubleListProperty: List.generate(5, (i) => i.toDouble()),
      );

      Repos.instance.categories.create(category);
    }
  }

  static Future<void> _seedUsers() async {
    final users = [
      User(email: 'john@example.com', name: 'John Doe'),
      User(email: 'jane@example.com', name: 'Jane Smith'),
      User(email: 'mike@example.com', name: 'Mike Wilson'),
      User(email: 'sarah@example.com', name: 'Sarah Parker'),
      User(email: 'alex@example.com', name: 'Alex Turner'),
    ];

    for (var user in users) {
      Repos.instance.users.create(user);
    }
  }

  static Future<void> _seedPosts() async {
    final users = Repos.instance.users.getAll();

    final posts = [
      Post(
        title: 'My Journey with Flutter',
        content:
            'Flutter has been an amazing journey. The hot reload feature is a game changer...',
      ),
      Post(
        title: 'Best Places to Visit in 2024',
        content:
            'After exploring various destinations, here are my top picks for 2024...',
      ),
      Post(
        title: 'Getting Started with ObjectBox',
        content:
            'ObjectBox is a fast and easy-to-use database solution for Flutter...',
      ),
      Post(
        title: 'Favorite Coffee Spots in Town',
        content: 'I\'ve discovered some hidden gems for coffee lovers...',
      ),
      Post(
        title: 'Mobile App Development Tips',
        content: 'Here are some essential tips I\'ve learned over the years...',
      ),
      Post(
        title: 'Weekend Getaway Ideas',
        content:
            'Looking for a quick escape? Here are some perfect weekend destinations...',
      ),
      Post(
        title: 'My Tech Stack for 2024',
        content: 'These are the technologies I\'m excited about this year...',
      ),
      Post(
        title: 'Remote Work Best Practices',
        content:
            'After working remotely for 2 years, here\'s what I\'ve learned...',
      ),
    ];

    // Distribute posts among users
    for (var i = 0; i < posts.length; i++) {
      posts[i].author.target = users[i % users.length];
      Repos.instance.posts.create(posts[i]);
    }
  }

  static Future<void> _seedComments() async {
    final users = Repos.instance.users.getAll();
    final posts = Repos.instance.posts.getAll();

    final commentTexts = [
      'Great post! Thanks for sharing.',
      'This is exactly what I needed to read today.',
      'Very informative, looking forward to more content like this.',
      'Interesting perspective! Have you considered...',
      'I completely agree with your points.',
      'This helped me a lot, thanks!',
      'Could you elaborate more on the second point?',
      'Well written and easy to understand.',
      'I had a similar experience.',
      'Looking forward to your next post!',
    ];

    // Add multiple comments to each post
    for (var post in posts) {
      // Add 2-4 random comments to each post
      final numberOfComments =
          2 + (post.id % 3); // Results in 2, 3, or 4 comments

      for (var i = 0; i < numberOfComments; i++) {
        final comment = Comment(
          content:
              commentTexts[((post.id + i) * 7) %
                  commentTexts.length], // Pseudo-random selection
        );

        // Assign a random user as the author
        comment.author.target = users[(post.id + i) % users.length];
        comment.post.target = post;

        Repos.instance.comments.create(comment);
      }
    }
  }

  static Future<void> _seedShapes() async {
    // keep empty to test empty box case.
    final shapes = [];

    for (var shape in shapes) {
      Repos.instance.shapes.create(shape);
    }
  }
}
