import 'package:flutter/material.dart';
import 'package:progit_activity_booker/models/activity.dart';
import 'package:progit_activity_booker/widgets/activity/activity_bubble.dart';

class ActivitiesRenderer extends StatelessWidget {
  final String title;
  late List<Activity> activities;
  final bool showAsGrid;

  ActivitiesRenderer({
    Key? key,
    required this.title,
    required this.showAsGrid,
    required Map<String, Activity> activityMap,
    Set<String>? activityFilter,
  }) : super(key: key) {
    if (activityFilter == null) {
      activities = activityMap.values.toList();
    } else {
      final filteredActivities = <Activity>[];
      for (final activity in activityMap.values) {
        final signUp = activityFilter.lookup(activity.uid);
        if (signUp != null) {
          filteredActivities.add(activity);
        }
      }
      activities = filteredActivities;
    }
  }

  ListView getList(BuildContext context) {
    return ListView.builder(
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
    );
  }

  GridView getGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 270,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: activities.length,
      itemBuilder: ((context, index) {
        return ActivityBubble(
          activity: activities[index],
          key: Key(
            activities[index].uid,
          ),
        );
      }),
    );
  }

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
        showAsGrid
            ? getGrid(context)
            : SizedBox(height: 136, child: getList(context)),
      ],
    );
  }
}
