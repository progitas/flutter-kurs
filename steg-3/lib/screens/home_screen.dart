import 'package:flutter/material.dart';
import 'package:progit_activity_booker/mock_data/activities.dart';
import 'package:progit_activity_booker/widgets/activity/get_activities_renderers.dart';
import 'package:progit_activity_booker/widgets/event/events_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: getActivitiesRenderers(
                    allActivities: ACTIVITIES.values.toList()),
              ),
              EventsList(),
            ],
          ),
        ),
      ),
    );
  }
}
