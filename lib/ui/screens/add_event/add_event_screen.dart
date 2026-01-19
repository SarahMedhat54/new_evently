import 'package:evently_c17/ui/event_dm.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:evently_c17/ui/utils/constants.dart';
import 'package:evently_c17/ui/widgets/app_textfield.dart';
import 'package:evently_c17/ui/widgets/categories_tab_bar.dart';
import 'package:evently_c17/ui/widgets/evently_button.dart';
import 'package:flutter/material.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  CategoryDM selectedCategory = AppConstants.customCategories[0];
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: Text("Add event"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      selectedCategory.imagePath,
                      height: MediaQuery.of(context).size.height * .25,
                    ),
                    SizedBox(height: 16),
                    CategoriesTabBar(
                      categories: AppConstants.customCategories,
                      onChanged: (category) {
                        selectedCategory = category;
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Title",
                      style: AppTextStyles.black16Medium,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8),
                    AppTextField(hint: "Event title"),
                    SizedBox(height: 16),
                    Text(
                      "Description",
                      style: AppTextStyles.black16Medium,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8),
                    AppTextField(hint: "Event description", minLines: 5),
                    SizedBox(height: 16),
                    buildDateRow(),
                    SizedBox(height: 16),
                    buildTimeRow(),
                  ],
                ),
              ),
            ),
            EventlyButton(text: "Add event", onClick: () {}),
          ],
        ),
      ),
    );
  }

  buildDateRow() => Row(
    children: [
      Icon(Icons.calendar_month, color: AppColors.blue, size: 24),
      SizedBox(width: 8),
      Text(
        "${selectedDate.year}/${selectedDate.month}/${selectedDate.day} ",
        style: AppTextStyles.black16Medium,
      ),
      Spacer(),
      InkWell(
        onTap: () async {
          selectedDate =
              (await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 365)),
                initialDate: selectedDate,
                selectableDayPredicate: (date) {
                  return date.weekday != 5;
                },
              )) ??
              selectedDate;
          setState(() {});
        },
        child: Text(
          "Choose date",
          style: AppTextStyles.blue14SemiBold.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ],
  );

  buildTimeRow() => Row(
    children: [
      Icon(Icons.timer_outlined, color: AppColors.blue, size: 24),
      SizedBox(width: 8),
      Text(
        "${selectedTime.hour}:${selectedTime.minute}",
        style: AppTextStyles.black16Medium,
      ),
      Spacer(),
      InkWell(
        onTap: () async {
          selectedTime =
              await showTimePicker(
                context: context,
                initialTime: selectedTime,
              ) ??
              selectedTime;
          setState(() {});
        },
        child: Text(
          "Choose time",
          style: AppTextStyles.blue14SemiBold.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ],
  );
}
