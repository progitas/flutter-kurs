import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progit_activity_booker/api/base_api_handler.dart';
import 'package:progit_activity_booker/models/profile.dart';

class UserAPI extends BaseApiHandler {
  UserAPI() : super('/user');

  Future<void> createUser(String email, String password, String name) async {
    final body = {'email': email, 'name': name, 'password': password};
    return post(body: body);
  }

  Stream<Profile?> getProfileStream(String uid) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((document) {
      if (!document.exists) {
        return null;
      }
      return Profile.fromJson(document.data()!);
    });
  }

  Stream<Map<String, Profile>> getUsersStream() {
    return FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .map((snapshot) {
      final res = <String, Profile>{};
      for (final doc in snapshot.docs) {
        final data = doc.data();
        res.putIfAbsent(doc.id, () => Profile.fromJson(data));
      }
      return res;
    });
  }
}
