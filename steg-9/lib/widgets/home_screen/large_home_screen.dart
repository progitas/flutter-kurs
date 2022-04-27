import 'package:flutter/material.dart';
import 'package:progit_activity_booker/mock_data/activities.dart';
import 'package:progit_activity_booker/widgets/activity/get_activities_renderers.dart';

class LargeHomeScreen extends StatelessWidget {
  const LargeHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getActivitiesRenderers(
          allActivities: ACTIVITIES.values.toList(), showAsGrid: true),
    );
  }
}
