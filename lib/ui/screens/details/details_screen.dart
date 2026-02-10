
import 'package:evently_c17/model/event_dm.dart';

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
    var theme = Theme.of(context);
    var isDark = Theme.of(context).brightness == Brightness.dark;
    String imageToShow = theme.brightness == Brightness.dark
        ? widget.event.imagePathDark
        : widget.event.imagePathLight;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppbarDetails(event: widget.event),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: theme.primaryColor),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    isDark
                        ? widget.event.categoryDM.imageDarkPath
                        : widget.event.categoryDM.imagePath,
                    imageToShow ,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 26),
              Text(widget.event.title, style: theme.textTheme.titleLarge),
              SizedBox(height: 20),
              Container(
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: theme.primaryColor),                ),
                child: TimesDetailsContainer(
                  title: DateFormat('d MMMM').format(widget.event.dateTime),
                  subTitle: DateFormat('hh:mm a').format(widget.event.dateTime),
                ),
              ),
              SizedBox(height: 20),
              Text("Description", style: theme.textTheme.titleLarge?.copyWith(fontSize: 18)),
              SizedBox(height: 10),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: theme.primaryColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.event.description,
                    style: theme.textTheme.bodyMedium,
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
