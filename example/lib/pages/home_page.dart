import 'package:example/models/post.dart';
import 'package:example/objectbox.inspector.g.dart';
import 'package:example/pages/post_page.dart';
import 'package:example/repos/repos.dart';
import 'package:flutter/material.dart';
import 'package:objectbox_inspector/objectbox_inspector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = <Post>[];

  @override
  void initState() {
    posts = Repos.instance.posts.getAll();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () => openObjectboxInspector(
              context,
              getInspectableBoxes(Repos.instance.store),
            ),
            icon: const Icon(Icons.bug_report),
          ),
        ],
      ),
      // a list of posts
      body: ListView(
        children: [
          for (var post in posts)
            // a clickable list item
            ListTile(
              title: Text(post.title),
              subtitle: Text(post.content),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostPage(postId: post.id),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
