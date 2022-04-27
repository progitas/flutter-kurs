import 'package:flutter/material.dart';
import 'package:progit_activity_booker/models/activity.dart';
import 'package:progit_activity_booker/widgets/activity/activity_bubble.dart';

class ActivitiesRenderer extends StatelessWidget {
  final String title;
  late List<Activity> activities;

  ActivitiesRenderer({
    Key? key,
    required this.title,
    required this.activities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        SizedBox(
          height: 136,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: activities.length,
            itemBuilder: ((context, index) {
              return ActivityBubble(
                activity: activities[index],
                key: Key(
                  activities[index].uid,
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
