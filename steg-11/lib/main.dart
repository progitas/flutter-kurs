import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progit_activity_booker/constants/app_colors.dart';
import 'package:progit_activity_booker/constants/custom_text_theme.dart';
import 'package:progit_activity_booker/router/route_generator.dart';
import 'package:progit_activity_booker/screens/log_in_screen.dart';
import 'package:progit_activity_booker/screens/splash_screen.dart';
import 'package:progit_activity_booker/screens/tabs/tab_screen.dart';
import 'package:progit_activity_booker/utils/my_custom_scroll_behavior.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: ProgitActivityBooker()));
}

class ProgitActivityBooker extends StatelessWidget {
  const ProgitActivityBooker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progit Activity Booker',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        primaryColorDark: AppColors.primary,
        primaryColorLight: AppColors.secondary,
        backgroundColor: AppColors.secondary,
        scaffoldBackgroundColor: AppColors.secondary,
        fontFamily: 'Assistant',
        textTheme: smallTextTheme,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData && snapshot.data?.uid != null) {
              return TabScreen();
            }
            return const LoginScreen();
          }
          return const SplashScreen();
        },
      ),
      scrollBehavior: MyCustomScrollBehavior(),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) =>
          RouteGenerator().generateMainRoute(
        settings,
      ),
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => TabScreen());
      },
    );
  }
}
