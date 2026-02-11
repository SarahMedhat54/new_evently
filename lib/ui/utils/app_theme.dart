import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.offWhite,
    colorScheme: ColorScheme.light(
      outline: AppColors.white,
      onSecondary: AppColors.blue
    ),
    primaryColor: AppColors.blue,
    cardColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.offWhite,
      iconTheme: IconThemeData(color: AppColors.blue),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      titleLarge: AppTextStyles.black16Medium,
      bodyMedium: AppTextStyles.black16Medium,
      bodySmall: AppTextStyles.grey212Regular,
      labelMedium: AppTextStyles.black20SemiBold,
      labelSmall: AppTextStyles.blue14Medium,
      //bodyLarge:
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: AppTextStyles.white18Medium,
      ),
    ),



  );


  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBlue,
    colorScheme: ColorScheme.dark(
      outline: AppColors.blue,
        onSecondary: AppColors.white

    ),
    primaryColor: AppColors.lightBlue,
    cardColor: Colors.transparent,


    textTheme: TextTheme(
      titleLarge: AppTextStyles.white14Medium,
      bodyMedium: AppTextStyles.grey14Regular.copyWith(color: Colors.white),
      labelMedium: TextStyle(color: AppColors.lightBlue, fontSize: 16, fontWeight: FontWeight.bold),
      bodySmall: AppTextStyles.white14Medium ,
      labelSmall: AppTextStyles.white18Medium,

    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBlue,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: AppTextStyles.white18Medium,
      ),
    ),

  );
}