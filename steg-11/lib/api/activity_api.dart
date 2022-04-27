import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progit_activity_booker/api/base_api_handler.dart';
import 'package:progit_activity_booker/models/activity.dart';
import 'package:progit_activity_booker/models/comment.dart';

class ActivityAPI extends BaseApiHandler {
  ActivityAPI() : super('/activity');

  Future<void> createActivity(Activity activity) {
    return post<void>(body: activity.toJson());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> listenToActivities() {
    final filter =
        DateTime.now().subtract(const Duration(days: 1)).millisecondsSinceEpoch;
    return FirebaseFirestore.instance
        .collection('activities')
        .where('time', isGreaterThan: filter)
        .orderBy('time')
        .snapshots();
  }

  Stream<List<Comment>> listenToCommentsForActivity(String activityId) {
    return FirebaseFirestore.instance
        .collection('activities')
        .doc(activityId)
        .collection('comments')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      final res = <Comment>[];
      for (final doc in snapshot.docs) {
        final data = doc.data();
        final comment = Comment.fromJson(data);
        res.add(comment);
      }
      return res;
    });
  }

  Future<void> createComment(String activityId, Comment comment) {
    return post<void>(
        url: getUrl(paths: [activityId, 'comment']), body: comment.toJson());
  }

  Future<void> signUpForActivity(String activityId) {
    return post<void>(
      url: getUrl(
        paths: [activityId, 'sign-up'],
      ),
    );
  }

  Future<void> removeSignUp(String activityId) {
    return post<void>(
      url: getUrl(
        paths: [activityId, 'remove-sign-up'],
      ),
    );
  }
}
