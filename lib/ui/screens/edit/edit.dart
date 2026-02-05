import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:evently_c17/ui/widgets/app_text_field.dart';
import 'package:evently_c17/ui/widgets/categories_tab_bar.dart';
import 'package:flutter/material.dart';

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

  @override   //  ده للحاجه القديمه
  void initState() {
    super.initState();
    selectedCategory = widget.event.categoryDM;
    titleController = TextEditingController(text: widget.event.title);
    descriptionController = TextEditingController(text: widget.event.description);
    selectedDate = widget.event.dateTime;
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
            child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new, color:  AppColors.blue,))
          ),
        ),
        title: Text("Edit Event", style: AppTextStyles.black16Medium),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      selectedCategory.imagePath,
                      height: MediaQuery.of(context).size.height * .25,
                    ),
                    SizedBox(height: 18),
                    CategoriesTabBar(
                      categories: AppConstants.customCategories,
                      onChanged: (category) {
                        this.selectedCategory = category;
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 18,),
                    Text("Title" , style: AppTextStyles.black16Medium,),
                    AppTextField(hint: "title", )
                    //AppTextField(hint: )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
