import 'package:progit_activity_booker/api/activity_api.dart';
import 'package:progit_activity_booker/api/event_api.dart';
import 'package:progit_activity_booker/api/sign_up_api.dart';
import 'package:progit_activity_booker/api/user_api.dart';

class _API {
  final activity = ActivityAPI();
  final event = EventAPI();
  final user = UserAPI();
  final signUp = SignUpAPI();
}

final API = _API();
