class Profile {
  final String uid;
  final String imageUrl;
  final String firstName;
  final String shortName;
  final String name;

  Profile({
    required this.uid,
    required this.shortName,
    required this.firstName,
    required this.imageUrl,
    required this.name,
  });

  Profile.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        firstName = json['firstName'],
        shortName = json['shortName'],
        name = json['name'] ?? json['shortName'],
        imageUrl = json['imageUrl'];

  toJson() {
    return {
      "uid": uid,
      "firstName": firstName,
      "shortName": shortName,
      "imageUrl": imageUrl,
    };
  }
}
