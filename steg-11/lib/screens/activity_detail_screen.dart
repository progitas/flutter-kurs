import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progit_activity_booker/api/API.dart';
import 'package:progit_activity_booker/models/comment.dart';
import 'package:progit_activity_booker/models/sign_up.dart';
import 'package:progit_activity_booker/providers/activities_provider.dart';
import 'package:progit_activity_booker/providers/user_provider.dart';
import 'package:progit_activity_booker/providers/users_provider.dart';
import 'package:progit_activity_booker/widgets/activity/attending_users.dart';
import 'package:progit_activity_booker/widgets/activity/join_activity.dart';
import 'package:progit_activity_booker/widgets/comment/comment_input.dart';
import 'package:progit_activity_booker/widgets/comment/comments_renderer.dart';
import 'package:progit_activity_booker/widgets/common/chip_button.dart';
import 'package:progit_activity_booker/widgets/common/loading_indicator.dart';
import 'package:progit_activity_booker/widgets/layout/screen_widget.dart';

class ActivityDetailsScreen extends ConsumerStatefulWidget {
  late final String _activityId;

  ActivityDetailsScreen({String? activityId, Key? key}) : super(key: key) {
    if (activityId != null) {
      _activityId = activityId;
    } else {
      _activityId = '-1';
    }
  }

  @override
  _ActivityDetailsScreenState createState() => _ActivityDetailsScreenState();
}

class _ActivityDetailsScreenState extends ConsumerState<ActivityDetailsScreen> {
  StreamSubscription? signUpStream;
  var _signUps = <String, SignUp>{};
  var _waitingList = <String, SignUp>{};

  @override
  void initState() {
    super.initState();
    signUpStream =
        API.signUp.getSignUpsForActivity(widget._activityId).listen((res) {
      final signUps = res['signUps'];
      final waitingList = res['waitingList'];
      if (signUps != null && waitingList != null) {
        setState(() {
          _signUps = signUps;
          _waitingList = waitingList;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    signUpStream?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final activities = ref.watch(ActivitiesProvider.provider
        .select((activitiesState) => activitiesState.activities));
    final users = ref
        .watch(UsersProvider.provider.select((usersState) => usersState.users));
    final user = ref
        .watch(UserProvider.provider.select((userState) => userState.profile));
    final activity = activities[widget._activityId];
    final createdBy = users[activity?.createdById];

    return ScreenWidget(
        scrollable: true,
        child: activity != null && user != null
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
                    activityId: activity.uid,
                    currentUserId: user.uid,
                    numberOfSignups: activity.numberOfSignUps,
                    numberOfSlots: activity.numberOfSlots,
                    signUps: _signUps,
                    waitingList: _waitingList,
                    answerBy: activity.answerBy,
                  ),
                  getSpacing(height: 20),
                  AttendingUsers(
                    title: 'Påmeldte',
                    signUps: _signUps,
                    users: users,
                  ),
                  if (_waitingList.isNotEmpty)
                    AttendingUsers(
                      title: 'Venteliste',
                      signUps: _waitingList,
                      users: users,
                    ),
                  getSpacing(),
                  CommentInput(
                    addComment: ((newMessage) {
                      return API.activity
                          .createComment(widget._activityId, newMessage);
                    }),
                  ),
                  getSpacing(),
                  StreamBuilder<List<Comment>>(
                      stream: API.activity
                          .listenToCommentsForActivity(widget._activityId),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return CommentsRenderer(comments: snapshot.data!);
                        } else if (snapshot.hasError) {
                          return const Text(
                              'En feil skjedde da vi lastet inn kommentarer');
                        }
                        return const Center(child: LoadingIndicator());
                      })
                ],
              )
            : noActivityFound(context));
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
        getSpacing(),
        ChipButton(
          large: true,
          label: 'Gå tilbake',
          onClick: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
