import 'package:progit_activity_booker/utils/time_utils.dart';

class Comment {
  String uid;
  String userId;
  DateTime timestamp;
  String text;

  Comment({
    required this.uid,
    required this.userId,
    required this.timestamp,
    required this.text,
  });

  Comment.fromJson(Map json)
      : uid = json['uid'],
        userId = json['userId'],
        timestamp = DateTime.fromMillisecondsSinceEpoch(json['timestamp']),
        text = json['text'];

  Comment.toCreate(this.text)
      : userId = '',
        timestamp = DateTime.now(),
        uid = '';

  toJson() {
    return {
      "text": text,
    };
  }

  get prettyTimestamp {
    return prettyPrintTime(timestamp, showTime: true, showYear: true);
  }
}
