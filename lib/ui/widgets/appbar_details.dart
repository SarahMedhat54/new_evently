import 'package:flutter/material.dart';

import '../../model/event_dm.dart';
import '../screens/edit/edit.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class AppbarDetails extends StatelessWidget implements PreferredSizeWidget {
  final EventDM event;
  const AppbarDetails({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor,
      //backgroundColor: theme.scaffoldBackgroundColor,
      title: Text("Event details", style: theme.textTheme.titleLarge,),
      leading: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color:theme.colorScheme.outline),          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: theme.colorScheme.onSecondary),
          ),
        ),
      ),
      actions: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all( color: theme.colorScheme.outline)
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => Edit(event: event),) );
            },
            icon: Icon(Icons.mode_edit_sharp, color: theme.primaryColor),
          ),
        ),
        SizedBox(width: 4),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all( color:theme.colorScheme.outline),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete_outline, color:AppColors.red),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);}