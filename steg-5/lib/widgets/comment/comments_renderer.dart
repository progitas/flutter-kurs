import 'package:flutter/material.dart';
import 'package:progit_activity_booker/mock_data/users.dart';
import 'package:progit_activity_booker/models/comment.dart';
import 'package:progit_activity_booker/widgets/comment/comment_renderer.dart';

class CommentsRenderer extends StatelessWidget {
  final List<Comment> comments;
  const CommentsRenderer({required this.comments, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = USERS;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: comments.length,
      itemBuilder: ((context, index) => CommentRenderer(
            comments[index],
            users,
            key: Key(comments[index].uid),
          )),
    );
  }
}
