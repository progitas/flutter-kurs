import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progit_activity_booker/api/API.dart';
import 'package:progit_activity_booker/models/profile.dart';
import 'package:progit_activity_booker/providers/user_provider.dart';

class UsersState {
  var users = <String, Profile>{};

  UsersState();

  copyWith({Map<String, Profile>? users}) {
    final copy = UsersState();
    copy.users = users ?? this.users;
    return copy;
  }
}

class UsersProvider extends StateNotifier<UsersState> {
  Profile? _profile;
  StreamSubscription<Map<String, Profile>?>? _usersStream;

  UsersProvider(Profile? profile) : super(UsersState()) {
    _profile = profile;
    if (_profile == null) {
      final newState = state.copyWith(users: {});
      updateState(newState);
      return;
    }
    listenToUsers();
  }

  void updateState(UsersState newState) {
    state = newState;
  }

  void setUsers(Map<String, Profile> users) {
    final newState = state.copyWith(users: users);
    updateState(newState);
  }

  void listenToUsers() {
    if (_profile != null) {
      try {
        _usersStream = API.user.getUsersStream().listen((users) {
          setUsers(users);
        });
      } catch (e) {
        print(e);
      }
    } else {
      _usersStream?.cancel();
      setUsers({});
    }
  }

  void stopListening() {
    _usersStream?.cancel();
  }

  static final provider =
      StateNotifierProvider<UsersProvider, UsersState>((ref) {
    final profile = ref
        .watch(UserProvider.provider.select((userState) => userState.profile));
    final provider = UsersProvider(profile);
    ref.onDispose(() {
      provider.stopListening();
    });
    return provider;
  });
}
