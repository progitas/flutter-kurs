import 'package:flutter/material.dart';
import 'package:progit_activity_booker/models/comment.dart';
import 'package:progit_activity_booker/models/profile.dart';

class CommentRenderer extends StatelessWidget {
  final Comment comment;
  final Map<String, Profile> users;
  const CommentRenderer(this.comment, this.users, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        constraints: const BoxConstraints(minHeight: 40),
        width: 360,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: DefaultTextStyle.merge(
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(comment.text),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          users[comment.userId]?.shortName ?? '',
                        ),
                      ),
                      Text(
                        comment.prettyTimestamp,
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
