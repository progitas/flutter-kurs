import 'package:flutter/material.dart';
import 'package:progit_activity_booker/providers/activities_provider.dart';
import 'package:progit_activity_booker/widgets/activity/get_activities_renderers.dart';

class LargeHomeScreen extends StatelessWidget {
  final ActivitiesState activitiesState;
  const LargeHomeScreen({required this.activitiesState, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getActivitiesRenderers(
          showAsGrid: true,
          allActivities: activitiesState.activities,
          waitingList: activitiesState.waitingList,
          signedUpFor: activitiesState.signUps),
    );
  }
}
