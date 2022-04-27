import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progit_activity_booker/models/sign_up.dart';

class SignUpAPI {
  Stream<Map<String, SignUp>> getSignUpsStream() {
    return FirebaseFirestore.instance
        .collection('signUps')
        .snapshots()
        .map((snapshot) {
      final res = <String, SignUp>{};
      for (final doc in snapshot.docs) {
        final data = doc.data();
        res.putIfAbsent(doc.id, () => SignUp.fromJson(data));
      }
      return res;
    });
  }

  Stream<Map<String, Map<String, SignUp>>> getSignUpsForActivity(
      String activityId) {
    return FirebaseFirestore.instance
        .collection('signUps')
        .where('activityId', isEqualTo: activityId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      final signUps = <String, SignUp>{};
      final waitingList = <String, SignUp>{};
      for (final doc in snapshot.docs) {
        final data = doc.data();
        final signUp = SignUp.fromJson(data);
        if (signUp.timestamp > 0) {
          signUps.putIfAbsent(signUp.userId, () => signUp);
        } else {
          waitingList.putIfAbsent(signUp.userId, () => signUp);
        }
      }
      return {'signUps': signUps, 'waitingList': waitingList};
    });
  }

  Stream<Map<String, Set<String>>> getSignUpsForUser(String userId) {
    return FirebaseFirestore.instance
        .collection('signUps')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      final signUps = <String>{};
      final waitingList = <String>{};
      for (final doc in snapshot.docs) {
        final data = doc.data();
        final signUp = SignUp.fromJson(data);
        if (signUp.timestamp > 0) {
          signUps.add(signUp.activityId);
        } else if (signUp.waitingList > 0) {
          waitingList.add(signUp.activityId);
        }
      }
      return {'signUps': signUps, 'waitingList': waitingList};
    });
  }
}
