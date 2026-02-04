import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class AppbarDetails extends StatelessWidget implements PreferredSizeWidget {
  const AppbarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.offWhite,
      title: Text("Event details", style: AppTextStyles.black20SemiBold),
      leading: Padding(
        padding: EdgeInsets.all(0.8),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: AppColors.blue),
          ),
        ),
      ),
      actions: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.mode_edit_sharp, color: AppColors.blue),
          ),
        ),
        SizedBox(width: 4),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete_outline, color: AppColors.red),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);}
