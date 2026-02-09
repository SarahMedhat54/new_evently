import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:evently_c17/ui/widgets/app_text_field.dart';
import 'package:evently_c17/ui/widgets/categories_tab_bar.dart';
import 'package:flutter/material.dart';

import '../../../fire_store/firebase.dart';
import '../../../model/event_dm.dart';
import '../../utils/constants.dart';

class Edit extends StatefulWidget {
  final EventDM event;

  const Edit({super.key, required this.event});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  //CategoryDM selectedCategory = AppConstants.customCategories[0];
  late CategoryDM selectedCategory;
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late DateTime selectedDate;
  late TimeOfDay selectedTime;

  @override //  ده للحاجه القديمه
  void initState() {
    super.initState();
    selectedCategory = widget.event.categoryDM;
    titleController = TextEditingController(text: widget.event.title);
    descriptionController = TextEditingController(text: widget.event.description);
    selectedDate = widget.event.dateTime;
    selectedTime = TimeOfDay.fromDateTime(widget.event.dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(16),
          child: Container(
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
        title: Text("Edit Event", style: AppTextStyles.black16Medium),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        selectedCategory.imagePath,
                        height: MediaQuery.of(context).size.height * .25,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 18),
                    CategoriesTabBar(
                      categories: AppConstants.customCategories,
                      onChanged: (category) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                    SizedBox(height: 18),
                    Text("Title", style: AppTextStyles.black16Medium),
                    const SizedBox(height: 8),
                    AppTextField(
                      controller: titleController,
                      hint: "Event Title",
                    ),
                    SizedBox(height: 18),
                    Text("Description", style: AppTextStyles.black16Medium),
                    const SizedBox(height: 8),
                    AppTextField(
                      controller: descriptionController,
                      hint: "Event Description",
                     // maxLines: 4,
                    ),
                    const SizedBox(height: 18),
                    buildChooseDateRow(),
                    const SizedBox(height: 10),
                    buildChooseTimeRow(),
                    const SizedBox(height: 20),
                    //AppTextField(hint: )
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                updateEvent();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text("Update Event", style: AppTextStyles.white18Medium),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateEvent() async {
    DateTime finalDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );
    widget.event.title = titleController.text;
    widget.event.description = descriptionController.text;
    widget.event.dateTime = finalDateTime;
    widget.event.categoryDM = selectedCategory;
    await updateEventInFirestore(widget.event);

    if (mounted) Navigator.pop(context);
  }

  buildChooseDateRow() => Row(
    children: [
      Icon(Icons.calendar_month, size: 24, color: AppColors.blue),
      SizedBox(width: 8),
      Text("Event Date", style: AppTextStyles.black16Medium),
      Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
      Spacer(),
      InkWell(
        onTap: () async {
          selectedDate =
              await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 365)),
                initialDate: selectedDate,
              ) ??
                  selectedDate;
          setState(() {});
        },
        child: Text(
          "Choose Date",
          style: AppTextStyles.blue14Regular.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ],
  );

  buildChooseTimeRow() => Row(
    children: [
      Icon(Icons.access_time, size: 24, color: AppColors.blue),
      SizedBox(width: 8),
      Text("Event Time", style: AppTextStyles.black16Medium),
      Text(" ${selectedTime.hour}:${selectedTime.minute}"),
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
          "Choose Time",
          style: AppTextStyles.blue14Regular.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ],
  );
}
