import 'package:evently_c17/model/event_dm.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:evently_c17/ui/widgets/times_details_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/constants.dart';
import '../../widgets/appbar_details.dart';

class DetailsScreen extends StatefulWidget {
  final EventDM event;
   DetailsScreen({super.key, required this.event});
   static String id = 'details';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  CategoryDM event = AppConstants.customCategories[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppbarDetails(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                child: Image.asset(
                 widget.event.categoryDM.imagePath ,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              SizedBox(height: 30),
              Text(widget.event.title, style: AppTextStyles.black20SemiBold),
              SizedBox(height: 20),
              TimesDetailsContainer(
                title: DateFormat('d MM').format(widget.event.dateTime),
                subTitle: DateFormat('hh:mm a').format(widget.event.dateTime),
              ),
              SizedBox(height: 20),
              Text("Description", style: AppTextStyles.black20SemiBold),
              SizedBox(height: 10),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  widget.event.description,
                  style: AppTextStyles.black14Medium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
