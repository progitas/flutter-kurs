import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progit_activity_booker/providers/user_provider.dart';
import 'package:progit_activity_booker/widgets/common/chip_button.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref
        .watch(UserProvider.provider.select((userState) => userState.profile));
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
