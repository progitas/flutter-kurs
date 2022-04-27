import 'package:flutter/material.dart';
import 'package:progit_activity_booker/models/profile.dart';
import 'package:progit_activity_booker/models/sign_up.dart';

class AttendingUsers extends StatelessWidget {
  final Map<String, SignUp> signUps;
  final Map<String, Profile> users;
  final String title;

  const AttendingUsers({
    required this.signUps,
    required this.users,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            height: 40,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: signUps.values.map(
                (signUp) {
                  final user = users[signUp.userId];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: getUserBubble(user),
                  );
                },
              ).toList(),
            ),
          ),
        )
      ],
    );
  }
}

Widget getUserBubble(Profile? user) {
  return user != null
      ? CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(user.imageUrl),
        )
      : const CircleAvatar();
}
