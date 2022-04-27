import 'package:flutter/material.dart';
import 'package:progit_activity_booker/constants/app_colors.dart';
import 'package:progit_activity_booker/constants/custom_text_theme.dart';

void main() {
  runApp(const ProgitActivityBooker());
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
      home: const Text('Progit Activity Booker'),
    );
  }
}
