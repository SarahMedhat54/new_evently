import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TimesDetailsContainer extends StatelessWidget {
  final String title ;
  final String subTitle ;
  const TimesDetailsContainer({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var isDark = theme.brightness == Brightness.dark;
    Color bordertColor = isDark ? theme.primaryColor : AppColors.white;
    return  Container(
      padding:  EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color:bordertColor),
        // border: Border.all(color: AppColors.blue, width: 1)
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: theme.cardColor,
              border: Border.all(color:bordertColor),
            ),
            child: Icon(Icons.calendar_month_outlined,color: theme.primaryColor,),
          ),
          SizedBox(width: 8,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: theme.textTheme.labelMedium
                ),
                //SizedBox(height: 4,),
                Text(
                  subTitle,
                  style: theme.textTheme.bodySmall
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}