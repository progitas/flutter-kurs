import 'package:flutter/material.dart';
import 'package:progit_activity_booker/models/event.dart';
import 'package:progit_activity_booker/screens/activity_detail_screen.dart';

class EventRenderer extends StatelessWidget {
  final Event event;

  const EventRenderer(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        onTap: () =>
            Navigator.of(context).pushNamed(ActivityDetailsScreen.routeName),
        child: Container(
          constraints: const BoxConstraints(minHeight: 40),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                event.eventText,
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    event.prettyTimestamp,
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
