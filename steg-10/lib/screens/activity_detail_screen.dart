import 'package:flutter/material.dart';
import 'package:progit_activity_booker/mock_data/activities.dart';
import 'package:progit_activity_booker/mock_data/sign_ups.dart';
import 'package:progit_activity_booker/mock_data/users.dart';
import 'package:progit_activity_booker/models/comment.dart';
import 'package:progit_activity_booker/widgets/activity/attending_users.dart';
import 'package:progit_activity_booker/widgets/activity/join_activity.dart';
import 'package:progit_activity_booker/widgets/comment/comment_input.dart';
import 'package:progit_activity_booker/widgets/comment/comments_renderer.dart';
import 'package:progit_activity_booker/widgets/common/chip_button.dart';
import 'package:progit_activity_booker/widgets/layout/screen_widget.dart';

class ActivityDetailsScreen extends StatefulWidget {
  late final String _activityId;

  ActivityDetailsScreen({String? activityId, Key? key}) : super(key: key) {
    if (activityId != null) {
      _activityId = activityId;
    } else {
      _activityId = '-1';
    }
  }

  @override
  State<ActivityDetailsScreen> createState() => _ActivityDetailsScreenState();
}

class _ActivityDetailsScreenState extends State<ActivityDetailsScreen> {
  List<Comment> _comments = [];

  @override
  Widget build(BuildContext context) {
    final activity = ACTIVITIES[widget._activityId];
    final createdBy = USERS[activity?.createdById];
    final waitingList = WAITING_LIST;
    final signUps = SIGN_UPS;
    final users = USERS;

    return Scaffold(
      body: ScreenWidget(
          scrollable: true,
          child: activity != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.title,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    getSpacing(),
                    getInfoLine('Arrangert av ${createdBy?.shortName}'),
                    getInfoLine('Sted: ${activity.location}'),
                    getInfoLine('Tid: ${activity.prettyTime}'),
                    getInfoLine('Svarfrist: ${activity.prettyAnswerBy}'),
                    getSpacing(),
                    Text(
                      'Informasjon fra ${createdBy?.shortName}:',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(activity.description),
                    getSpacing(),
                    JoinActivity(
                      currentUserId: '1',
                      signUps: signUps,
                      waitingList: waitingList,
                      numberOfSlots: activity.numberOfSlots,
                      numberOfSignups: activity.numberOfSignUps,
                      activityId: widget._activityId,
                      answerBy: activity.answerBy,
                    ),
                    getSpacing(height: 20),
                    AttendingUsers(
                      title: 'Påmeldte',
                      signUps: signUps,
                      users: users,
                    ),
                    if (waitingList.isNotEmpty)
                      AttendingUsers(
                        title: 'Venteliste',
                        signUps: waitingList,
                        users: users,
                      ),
                    getSpacing(),
                    CommentInput(addComment: (newMessage) {
                      _comments.insert(0, newMessage);
                      setState(() {
                        _comments = _comments;
                      });
                    }),
                    getSpacing(),
                    CommentsRenderer(comments: _comments)
                  ],
                )
              : noActivityFound(context)),
    );
  }
}

Widget getInfoLine(String text) {
  return Text(
    text,
    textAlign: TextAlign.left,
    style: const TextStyle(fontSize: 16),
  );
}

Widget getSpacing({double height = 10}) {
  return SizedBox(
    height: height,
  );
}

Widget noActivityFound(BuildContext context) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Ingen aktivitiet funnet :( Gå tilbake.',
        ),
        ChipButton(
          label: 'Gå tilbake',
          onClick: () => Navigator.of(context).pushReplacementNamed('/'),
        ),
      ],
    ),
  );
}
