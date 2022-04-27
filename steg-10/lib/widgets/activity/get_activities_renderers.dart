import 'package:flutter/material.dart';
import 'package:progit_activity_booker/models/activity.dart';
import 'package:progit_activity_booker/widgets/activity/activities_renderer.dart';

List<Widget> getActivitiesRenderers({
  required Map<String, Activity> allActivities,
  required Set<String> signedUpFor,
  required Set<String> waitingList,
  required bool showAsGrid,
}) {
  return [
    if (signedUpFor.isNotEmpty)
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ActivitiesRenderer(
          title: 'Aktiviteter du er påmeldt',
          activityMap: allActivities,
          activityFilter: signedUpFor,
          showAsGrid: showAsGrid,
        ),
      ),
    if (waitingList.isNotEmpty)
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ActivitiesRenderer(
          title: 'Aktiviteter du er på venteliste for',
          activityMap: allActivities,
          activityFilter: waitingList,
          showAsGrid: showAsGrid,
        ),
      ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ActivitiesRenderer(
        title: 'Kommende aktiviteter',
        activityMap: allActivities,
        showAsGrid: showAsGrid,
      ),
    ),
  ];
}
