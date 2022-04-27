import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:progit_activity_booker/api/API.dart';
import 'package:riverpod/riverpod.dart';

import '../models/profile.dart';

class UserState {
  var isLoggedIn = false;
  Profile? profile;

  UserState();

  copyWith({bool? isLoggedIn, Profile? profile}) {
    final copy = UserState();
    copy.isLoggedIn = isLoggedIn ?? this.isLoggedIn;
    copy.profile = profile ?? this.profile;
    return copy;
  }
}

class UserProvider extends StateNotifier<UserState> {
  StreamSubscription<Profile?>? _profileStream;
  StreamSubscription<User?>? _userStream;
  UserProvider() : super(UserState()) {
    _userStream = FirebaseAuth.instance.authStateChanges().listen((user) {
      setProfileListener(user);
      if (user?.uid != null) {
        setLoggedIn(isLoggedIn: true);
      } else {
        setLoggedIn(isLoggedIn: false);
      }
    });
  }

  void updateState(UserState newState) {
    state = newState;
  }

  void setLoggedIn({required bool isLoggedIn}) {
    final newState = state.copyWith(isLoggedIn: isLoggedIn);
    updateState(newState);
  }

  void setProfile(Profile? profile) {
    final newState = state.copyWith(profile: profile);
    updateState(newState);
  }

  void setProfileListener(User? user) {
    if (user != null) {
      try {
        _profileStream = API.user.getProfileStream(user.uid).listen((profile) {
          setProfile(profile);
        });
      } catch (error, stackTrace) {
        print(error);
      }
    } else {
      _profileStream?.cancel();
      setProfile(null);
    }
  }

  void stopListening() {
    _profileStream?.cancel();
    _userStream?.cancel();
  }

  static final provider = StateNotifierProvider<UserProvider, UserState>((ref) {
    final provider = UserProvider();
    ref.onDispose(() {
      provider.stopListening();
    });
    return provider;
  });
}
