import 'package:evently_c17/model/event_dm.dart';
import 'package:evently_c17/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';

abstract final class AppConstants {
  static CategoryDM all = CategoryDM(
    name: "all",
    imagePath: "",
    imagePathLight: "",
    imagePathDark: "",
    icon: Icons.border_all_rounded,
    imageDarkPath: '',
  );

  static CategoryDM sports = CategoryDM(
    name: "sports",
    imagePath: AppAssets.sportLight,
    imagePathLight: AppAssets.sportLight,
    imagePathDark: AppAssets.sportDark,
    icon: Icons.bike_scooter,
    imageDarkPath: AppAssets.sportDark,
  );

  static CategoryDM bookingClub = CategoryDM(
    name: "bookingClub",
    imagePath: AppAssets.bookClubLight,
    imagePathLight: AppAssets.bookClubLight,
    imagePathDark: AppAssets.bookClubDark,
    icon: Icons.menu_book,
    imageDarkPath: AppAssets.bookClubDark,
  );

  static CategoryDM birthday = CategoryDM(
    name: "birthday",
    imagePath: AppAssets.birthdayLight,
    imagePathLight: AppAssets.birthdayLight,
    imagePathDark: AppAssets.birthdayDark,
    icon: Icons.cake,
    imageDarkPath: AppAssets.birthdayDark,
  );

  static CategoryDM meeting = CategoryDM(
    name: "meeting",
    imagePath: AppAssets.meetingLight,
    imagePathLight: AppAssets.meetingLight,
    imagePathDark: AppAssets.meetingDark,
    icon: Icons.meeting_room,
    imageDarkPath: AppAssets.meetingDark,
  );

  static CategoryDM exhibition = CategoryDM(
    name: "exhibition",
    imagePath: AppAssets.exhibitionLight,
    imagePathLight: AppAssets.exhibitionLight,
    imagePathDark: AppAssets.exhibitionDark,
    icon: Icons.access_time_filled_rounded,
    imageDarkPath: AppAssets.exhibitionDark,
  );

  static List<CategoryDM> allCategories = [
    all,
    sports,
    bookingClub,
    birthday,
    meeting,
    exhibition,
  ];

  static List<CategoryDM> customCategories = [
    sports,
    bookingClub,
    birthday,
    meeting,
    exhibition,
  ];
}