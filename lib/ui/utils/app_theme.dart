import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.offWhite,
    primaryColor: AppColors.blue,
    cardColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.offWhite,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      titleLarge: AppTextStyles.black20SemiBold,
      bodyMedium: AppTextStyles.black16Medium,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBlue,
    primaryColor: AppColors.blue,
    cardColor: Colors.transparent,

    textTheme: TextTheme(
      titleLarge: AppTextStyles.black20SemiBold.copyWith(color: Colors.white),
      bodyMedium: AppTextStyles.black16Medium.copyWith(color: Colors.white),
      labelMedium: TextStyle(color: AppColors.blue, fontSize: 16, fontWeight: FontWeight.bold),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBlue,
      iconTheme: IconThemeData(color: AppColors.blue),
      titleTextStyle: TextStyle(color: AppColors.blue, fontSize: 16),
    ),
  );
}