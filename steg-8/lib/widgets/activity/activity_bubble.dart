import 'package:flutter/material.dart';
import 'package:progit_activity_booker/models/activity.dart';
import 'package:progit_activity_booker/router/route_generator.dart';

class ActivityBubble extends StatelessWidget {
  final Activity activity;
  const ActivityBubble({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: InkWell(
          onTap: () => Navigator.of(context)
              .pushNamed(ActivityRoute.path, arguments: activity.uid),
          borderRadius: BorderRadius.circular(20),
          splashColor: Theme.of(context).primaryColor,
          child: Ink(
            width: 195,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              color: Theme.of(context).primaryColor,
            ),
            child: DefaultTextStyle.merge(
              style: TextStyle(
                color: Theme.of(context).primaryColorLight,
                fontSize: 14,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity.title,
                        softWrap: false,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        activity.location,
                        style: thinText,
                      ),
                      Text(
                        activity.prettyTime,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Påmeldte: ',
                          style: thinText,
                          children: [
                            TextSpan(
                              text:
                                  '${activity.numberOfSignUps}/${activity.numberOfSlots}',
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Svarfrist: ',
                          style: thinText,
                          children: [
                            TextSpan(
                              text: '${activity.prettyAnswerBy}',
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const thinText = TextStyle(fontWeight: FontWeight.w200);
