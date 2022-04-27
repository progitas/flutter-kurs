import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progit_activity_booker/mock_data/users.dart';
import 'package:progit_activity_booker/widgets/common/chip_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = USERS['5'];
    return SizedBox(
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (user != null)
              CircleAvatar(
                backgroundImage: NetworkImage(user.imageUrl),
                radius: 50,
              ),
            const SizedBox(
              height: 10,
            ),
            Text('Du er logget inn som ${user?.name}'),
            const SizedBox(
              height: 10,
            ),
            ChipButton(
              label: 'Logg ut',
              onClick: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ]),
    );
  }
}
