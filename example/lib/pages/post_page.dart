import 'package:example/models/comment.dart';
import 'package:example/models/post.dart';
import 'package:example/models/user.dart';
import 'package:example/repos/repos.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  final int postId;

  const PostPage({
    super.key,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: FutureBuilder(
        future: _loadPostData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final postData = snapshot.data!;
          final post = postData['post'] as Post;
          final user = postData['user'] as User;
          final comments = postData['comments'] as List<Comment>;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PostHeader(post: post, user: user),
                const SizedBox(height: 16),
                _PostContent(post: post),
                const SizedBox(height: 24),
                const Text(
                  'Comments',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _CommentsList(comments: comments),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<Map<String, dynamic>> _loadPostData() async {
    final post = Repos.instance.posts.getById(postId);
    final user = Repos.instance.users.getById(post!.author.targetId);
    final comments = Repos.instance.comments.getByPostId(postId);

    return {
      'post': post,
      'user': user,
      'comments': comments,
    };
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  final User user;

  const _PostHeader({
    required this.post,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              child: Text(user.name[0]),
            ),
            const SizedBox(width: 8),
            Text(
              user.name,
              style: tt.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          post.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}

class _PostContent extends StatelessWidget {
  final Post post;

  const _PostContent({
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      post.content,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

class _CommentsList extends StatelessWidget {
  final List<Comment> comments;

  const _CommentsList({
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: comments.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final comment = comments[index].content;
        final user = comments[index].author.target!;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    child: Text(user.name[0]),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    user.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(comment),
            ],
          ),
        );
      },
    );
  }
}
