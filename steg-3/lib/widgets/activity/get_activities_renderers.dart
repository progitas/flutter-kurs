import 'package:flutter/material.dart';
import 'package:progit_activity_booker/models/activity.dart';
import 'package:progit_activity_booker/widgets/activity/activities_renderer.dart';

List<Widget> getActivitiesRenderers({
  required List<Activity> allActivities,
}) {
  return [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ActivitiesRenderer(
        title: 'Aktiviteter du er påmeldt',
        activities: allActivities,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ActivitiesRenderer(
        title: 'Aktiviteter du er på venteliste for',
        activities: allActivities,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ActivitiesRenderer(
        title: 'Kommende aktiviteter',
        activities: allActivities,
      ),
    ),
  ];
}
