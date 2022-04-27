import 'package:flutter/widgets.dart';
import 'package:progit_activity_booker/constants/app_colors.dart';
import 'package:progit_activity_booker/models/activity.dart';
import 'package:progit_activity_booker/models/profile.dart';
import 'package:progit_activity_booker/utils/enum_helpers.dart';
import 'package:progit_activity_booker/utils/time_utils.dart';

class Event {
  String uid;
  EVENT_TYPE eventType;
  DateTime timestamp;
  String userId;
  String activityId;
  late Text eventText;

  Event({
    required this.uid,
    required this.eventType,
    required this.timestamp,
    required this.activityId,
    required this.userId,
    Map<String, Profile>? users,
    Map<String, Activity>? activities,
  }) {
    eventText = getEventText(users?[userId], activities?[activityId]);
  }

  Event.fromJson(
    Map json, {
    Map<String, Profile>? users,
    Map<String, Activity>? activities,
  })  : uid = json['uid'],
        eventType = convertStringToEnum(json['eventType'], EVENT_TYPE.values) ??
            EVENT_TYPE.UNKNOWN,
        timestamp = DateTime.fromMillisecondsSinceEpoch(
          json['timestamp'] ?? DateTime.now().millisecondsSinceEpoch,
        ),
        userId = json['userId'] ?? '',
        activityId = json['activityId'] ?? '' {
    eventText = getEventText(users?[userId], activities?[activityId]);
  }

  Text getEventText(Profile? user, Activity? activity) {
    return Text.rich(
      TextSpan(
        style: const TextStyle(color: AppColors.secondary),
        text: user?.shortName,
        children: [
          const TextSpan(text: ' '),
          eventTypeToReadableText[eventType] ??
              const TextSpan(
                text: '',
              ),
          const TextSpan(text: ' '),
          TextSpan(
            text: activity?.title ?? '',
            style: boldFontWeight,
          )
        ],
      ),
    );
  }

  get prettyTimestamp {
    return prettyPrintTime(timestamp, showTime: true);
  }

  toJson() {
    return {
      "uid": uid,
      "activityType": eventType,
      "timeStamp": timestamp,
      "userUid": userId,
      "activityUid": activityId,
    };
  }
}

enum EVENT_TYPE {
  CREATE,
  UPDATE,
  DELETE,
  REGISTER,
  UNREGISTER,
  WAITING_LIST,
  UNKNOWN
}

const boldFontWeight = TextStyle(fontWeight: FontWeight.bold);

Map<EVENT_TYPE, TextSpan> eventTypeToReadableText = {
  EVENT_TYPE.CREATE: const TextSpan(
    text: 'lagde ',
    style: boldFontWeight,
    children: [
      TextSpan(
        text: 'arrangementet',
        style: TextStyle(
          fontWeight: FontWeight.normal,
        ),
      )
    ],
  ),
  EVENT_TYPE.DELETE: const TextSpan(
    text: 'slettet ',
    style: boldFontWeight,
    children: [
      TextSpan(
        text: 'arrangementet',
        style: TextStyle(
          fontWeight: FontWeight.normal,
        ),
      )
    ],
  ),
  EVENT_TYPE.UPDATE: const TextSpan(
    text: 'oppdaterte ',
    style: boldFontWeight,
    children: [
      TextSpan(
        text: 'arrangementet',
        style: TextStyle(
          fontWeight: FontWeight.normal,
        ),
      )
    ],
  ),
  EVENT_TYPE.REGISTER: const TextSpan(
    text: 'meldte seg ',
    children: [
      TextSpan(
        text: 'på',
        style: boldFontWeight,
      ),
    ],
  ),
  EVENT_TYPE.UNREGISTER: const TextSpan(
    text: 'meldte seg ',
    children: [
      TextSpan(
        text: 'av',
        style: boldFontWeight,
      )
    ],
  ),
  EVENT_TYPE.WAITING_LIST: const TextSpan(
    text: 'er på ',
    children: [
      TextSpan(
        text: 'venteliste på ',
        style: boldFontWeight,
      ),
    ],
  ),
};
