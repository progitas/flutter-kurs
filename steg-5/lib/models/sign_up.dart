class SignUp {
  String uid;
  String activityId;
  int timestamp;
  String userId;
  int waitingList;

  SignUp({
    required this.uid,
    required this.activityId,
    required this.timestamp,
    required this.userId,
    required this.waitingList,
  });

  SignUp.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        activityId = json['activityId'],
        timestamp = json['timestamp'],
        userId = json['userId'],
        waitingList = json['waitingList'];
}
