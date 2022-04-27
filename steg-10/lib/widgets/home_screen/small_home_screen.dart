import 'package:flutter/material.dart';
import 'package:progit_activity_booker/providers/activities_provider.dart';
import 'package:progit_activity_booker/widgets/activity/get_activities_renderers.dart';
import 'package:progit_activity_booker/widgets/event/events_list.dart';

class SmallHomeScreen extends StatelessWidget {
  final ActivitiesState activitiesState;

  const SmallHomeScreen({required this.activitiesState, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: getActivitiesRenderers(
              showAsGrid: false,
              allActivities: activitiesState.activities,
              waitingList: activitiesState.waitingList,
              signedUpFor: activitiesState.signUps),
        ),
        EventsList(),
      ],
    );
  }
}
