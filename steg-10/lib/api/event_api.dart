import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progit_activity_booker/models/activity.dart';
import 'package:progit_activity_booker/models/event.dart';
import 'package:progit_activity_booker/models/profile.dart';

class EventAPI {
  Stream<List<Event>> listenToEvents(
      Map<String, Profile>? users, Map<String, Activity>? activities) {
    return FirebaseFirestore.instance
        .collection('events')
        .orderBy('timestamp', descending: true)
        .limit(25)
        .snapshots()
        .map((snapshot) {
      final res = <Event>[];
      for (final doc in snapshot.docs) {
        final data = doc.data();
        final event =
            Event.fromJson(data, users: users, activities: activities);
        res.add(event);
      }
      return res;
    });
  }
}
