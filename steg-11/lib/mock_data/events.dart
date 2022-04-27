import 'package:progit_activity_booker/mock_data/activities.dart';
import 'package:progit_activity_booker/mock_data/users.dart';
import 'package:progit_activity_booker/models/event.dart';

Map<String, Event> EVENTS = {
  '1': Event(
      uid: '1',
      activityId: '1',
      eventType: EVENT_TYPE.CREATE,
      timestamp: DateTime.now(),
      userId: '1',
      activities: ACTIVITIES,
      users: USERS),
  '2': Event(
      uid: '2',
      activityId: '2',
      eventType: EVENT_TYPE.CREATE,
      timestamp: DateTime.now(),
      userId: '2',
      activities: ACTIVITIES,
      users: USERS),
  '3': Event(
      uid: '3',
      activityId: '3',
      eventType: EVENT_TYPE.CREATE,
      timestamp: DateTime.now(),
      userId: '3',
      activities: ACTIVITIES,
      users: USERS),
  '4': Event(
      uid: '4',
      activityId: '4',
      eventType: EVENT_TYPE.CREATE,
      timestamp: DateTime.now(),
      userId: '4',
      activities: ACTIVITIES,
      users: USERS),
  '5': Event(
      uid: '5',
      activityId: '5',
      eventType: EVENT_TYPE.CREATE,
      timestamp: DateTime.now(),
      userId: '5',
      activities: ACTIVITIES,
      users: USERS),
  '6': Event(
      uid: '6',
      activityId: '6',
      eventType: EVENT_TYPE.CREATE,
      timestamp: DateTime.now(),
      userId: '6',
      activities: ACTIVITIES,
      users: USERS),
  '7': Event(
      uid: '7',
      activityId: '7',
      eventType: EVENT_TYPE.CREATE,
      timestamp: DateTime.now(),
      userId: '7',
      activities: ACTIVITIES,
      users: USERS),
  '8': Event(
      uid: '8',
      activityId: '8',
      eventType: EVENT_TYPE.CREATE,
      timestamp: DateTime.now(),
      userId: '8',
      activities: ACTIVITIES,
      users: USERS),
};