import 'package:progit_activity_booker/utils/enum_helpers.dart';
import 'package:progit_activity_booker/utils/time_utils.dart';

enum ACTIVITY_CATEGORY { SPORT, SOCIAL, FOOD, UNKNOWN }

enum ACTIVITY_STATUS {
  FREE_SPOTS,
  USER_HAVE_BOOKED,
  WAITING_LIST,
  USER_IS_ON_WAITING_LIST,
  TIME_IS_OUT
}

class Activity {
  String uid;
  String createdById;
  String title;
  String location;
  DateTime time;
  DateTime answerBy;
  int numberOfSlots;
  int numberOfSignUps;
  String description;
  ACTIVITY_CATEGORY category;

  Activity({
    required this.uid,
    required this.createdById,
    required this.title,
    required this.location,
    required this.time,
    required this.answerBy,
    required this.numberOfSlots,
    required this.description,
    required this.category,
    required this.numberOfSignUps,
  });

  Activity.toCreate({
    required this.title,
    required this.location,
    required this.time,
    required this.answerBy,
    required this.numberOfSlots,
    required this.description,
    required this.category,
  })  : uid = '',
        createdById = '',
        numberOfSignUps = 0;

  Activity.fromJson(Map json)
      : uid = json['uid'],
        createdById = json['createdById'],
        title = json['title'] ?? '',
        category =
            convertStringToEnum(json['category'], ACTIVITY_CATEGORY.values) ??
                ACTIVITY_CATEGORY.UNKNOWN,
        description = json['description'] ?? '',
        numberOfSlots = json['numberOfSlots'] ?? -1,
        numberOfSignUps = json['numberOfSignUps'] ?? -1,
        answerBy = json['answerBy'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['answerBy'])
            : DateTime.now(),
        location = json['location'] ?? '',
        time = json['time'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['time'])
            : DateTime.now();

  get prettyTime {
    return prettyPrintTime(time, showTime: true);
  }

  get prettyAnswerBy {
    return prettyPrintTime(answerBy, showTime: true);
  }

  toJson() {
    return {
      "title": title,
      "location": location,
      "time": time.toUtc().millisecondsSinceEpoch,
      "answerBy": answerBy.toUtc().millisecondsSinceEpoch,
      "numberOfSlots": numberOfSlots,
      "description": description,
      "category": convertEnumToString(category),
    };
  }
}
