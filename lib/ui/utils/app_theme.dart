import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.offWhite,
    primaryColor: AppColors.blue,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
    textTheme: TextTheme(
      titleLarge: AppTextStyles.black20SemiBold
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBlue,
    primaryColor: AppColors.lightBlue,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
    textTheme: TextTheme(
        titleLarge: AppTextStyles.black20SemiBold.copyWith(color: Colors.white)
    ),

  );
}
