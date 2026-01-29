import 'package:evently_c17/ui/model/user_dm.dart';
import 'package:evently_c17/ui/providers/language_provider.dart';
import 'package:evently_c17/ui/providers/theme_provider.dart';
import 'package:evently_c17/ui/utils/app_assets.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    themeProvider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            child: Image.asset(AppAssets.appLogo),
            minRadius: 100,
            backgroundColor: AppColors.white,
          ),
          SizedBox(height: 12),
          Text(UserDM.currentUser!.name, style: AppTextStyles.black20SemiBold),
          SizedBox(height: 12),
          Text(UserDM.currentUser!.email, style: AppTextStyles.black16Medium),
          SizedBox(height: 12),
          buildThemeRow(),
          buildLanguageRow(),
          buildLogoutRow(),
        ],
      ),
    );
  }

  buildThemeRow() => Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    child: Row(
      children: [
        Text("Dark mode"),
        Spacer(),
        Switch(
          value: themeProvider.themeMode == ThemeMode.dark,
          onChanged: (value) {
            themeProvider.updateTheme(value ? ThemeMode.dark : ThemeMode.light);
          },
        ),
      ],
    ),
  );

  late LanguageProvider provider;
  late ThemeProvider themeProvider;

  buildLanguageRow() => Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    child: Row(
      children: [
        Text("Language"),
        Spacer(),
        Switch(
          value: provider.currentLocale == "ar",
          onChanged: (value) {
            print(
              "buildLanguageRow provider.current = ${provider.currentLocale}",
            );
            provider.updateLocale(value ? "ar" : "en");
          },
        ),
      ],
    ),
  );

  buildLogoutRow() => Container();
}
