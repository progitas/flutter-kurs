import 'package:flutter/material.dart';
import 'package:progit_activity_booker/mock_data/activities.dart';
import 'package:progit_activity_booker/widgets/activity/get_activities_renderers.dart';
import 'package:progit_activity_booker/widgets/event/events_list.dart';

class SmallHomeScreen extends StatelessWidget {
  const SmallHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: getActivitiesRenderers(
            showAsGrid: false,
            allActivities: ACTIVITIES.values.toList(),
          ),
        ),
        EventsList(),
      ],
    );
  }
}
