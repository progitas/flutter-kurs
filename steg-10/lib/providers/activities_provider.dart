import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progit_activity_booker/api/API.dart';
import 'package:progit_activity_booker/models/activity.dart';
import 'package:progit_activity_booker/providers/user_provider.dart';

class ActivitiesState {
  var loading = true;
  var activities = <String, Activity>{};
  var signUps = <String>{};
  var waitingList = <String>{};
  var lastUpdate = DateTime.now();

  copyWith(
      {bool? loading,
      Map<String, Activity>? activities,
      Set<String>? signUps,
      Set<String>? waitingList}) {
    final copy = ActivitiesState();
    copy.loading = loading ?? this.loading;
    copy.activities = activities ?? this.activities;
    copy.signUps = signUps ?? this.signUps;
    copy.waitingList = waitingList ?? this.waitingList;
    copy.lastUpdate = DateTime.now();
    return copy;
  }
}

class ActivitiesProvider extends StateNotifier<ActivitiesState> {
  StreamSubscription? _activityStream;
  StreamSubscription? _signUpStream;

  ActivitiesProvider(String? userId) : super(ActivitiesState()) {
    listenToActivities();
    if (userId != null) {
      listenToSignUps(userId);
    } else {
      stopListening();
    }
  }

  void _updateState(ActivitiesState newState) {
    state = newState;
  }

  void setActivities(Map<String, Activity> activities) {
    final newState = state.copyWith(activities: activities);
    _updateState(newState);
  }

  void setSignUps(Set<String>? signUps, Set<String>? waitingList) {
    final newState = state.copyWith(signUps: signUps, waitingList: waitingList);
    _updateState(newState);
  }

  void listenToActivities() {
    _activityStream = API.activity.listenToActivities().listen((snapshot) {
      final map = <String, Activity>{};
      final list = <Activity>[];
      for (final doc in snapshot.docs) {
        final activity = Activity.fromJson(doc.data());
        map.putIfAbsent(doc.id, () => activity);
        list.add(activity);
      }
      setActivities(map);
    });
  }

  void listenToSignUps(String userId) {
    _signUpStream = API.signUp.getSignUpsForUser(userId).listen((snapshot) {
      setSignUps(snapshot['signUps'], snapshot['waitingList']);
    });
  }

  void stopListening() {
    _activityStream?.cancel();
    _signUpStream?.cancel();
    setActivities({});
  }

  static final provider =
      StateNotifierProvider<ActivitiesProvider, ActivitiesState>((ref) {
    final user = ref
        .watch(UserProvider.provider.select((userState) => userState.profile));
    final provider = ActivitiesProvider(user?.uid);
    ref.onDispose(provider.stopListening);
    return provider;
  });
}
