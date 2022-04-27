import 'package:flutter/material.dart';
import 'package:progit_activity_booker/constants/app_colors.dart';

var largeTextTheme = const TextTheme(
  headline1: TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  ),
  headline3: TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  ),
);

var smallTextTheme = const TextTheme(
  headline1: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  ),
  headline3: TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  ),
);
