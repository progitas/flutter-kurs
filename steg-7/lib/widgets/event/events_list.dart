import 'package:flutter/material.dart';
import 'package:progit_activity_booker/mock_data/events.dart';
import 'package:progit_activity_booker/widgets/event/event_renderer.dart';

class EventsList extends StatelessWidget {
  final title = 'Oppdateringer';

  const EventsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final events = EVENTS.values.toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline1,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: events.length,
              itemBuilder: ((context, index) => EventRenderer(
                    events[index],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
