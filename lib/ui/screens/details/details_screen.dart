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
      appBar: AppbarDetails(event: widget.event),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    widget.event.categoryDM.imagePath ,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 26),
              Text(widget.event.title, style: AppTextStyles.black20SemiBold),
              SizedBox(height: 20),
              Container(
                decoration:  BoxDecoration(
                  color: AppColors.white,

                ),
                child: TimesDetailsContainer(
                  title: DateFormat('d MMMM').format(widget.event.dateTime),
                  subTitle: DateFormat('hh:mm a').format(widget.event.dateTime),
                ),
              ),
              SizedBox(height: 20),
              Text("Description", style: AppTextStyles.black20SemiBold),
              SizedBox(height: 10),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.event.description,
                    style: AppTextStyles.black16Medium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
