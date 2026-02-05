import 'package:evently_c17/model/event_dm.dart';
import 'package:evently_c17/ui/utils/app_assets.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:evently_c17/ui/utils/constants.dart';
import 'package:evently_c17/ui/widgets/categories_tab_bar.dart';
import 'package:evently_c17/ui/widgets/event_widget.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<EventDM> events = [];
  List<EventDM> filteredEvents = [];
  var selectedCategory = AppConstants.allCategories[0];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          buildHeader(), buildCategoriesTabBar(),
          //buildEventsList()
      ],
      ),
    );
  }

  buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Row(
          children: [
            Text("Welcome Back ✨", style: AppTextStyles.grey14Regular),
            Spacer(),
            Icon(Icons.brightness_5, color: AppColors.blue, size: 24),
            SizedBox(width: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "En",
                style: TextStyle(color: AppColors.white, fontSize: 14),
              ),
            ),
          ],
        ),
        Text(
          "John Safwat",
          textAlign: TextAlign.start,
          style: AppTextStyles.black20SemiBold,
        ),
      ],
    );
  }

  buildCategoriesTabBar() {
    return CategoriesTabBar(
      categories: AppConstants.allCategories,
      onChanged: (category) {
        print(category.name);
      },
    );
  }
}
