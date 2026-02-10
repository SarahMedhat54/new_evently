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
    return  Container(
      padding:  EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.primaryColor),
        // border: Border.all(color: AppColors.blue, width: 1)
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: theme.primaryColor.withOpacity(0.1),
              border: Border.all(color: theme.primaryColor),
            ),
            child: Icon(Icons.calendar_month,color: theme.primaryColor,),
          ),
          SizedBox(width: 8,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 16,
                  color: theme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                ),
                //SizedBox(height: 4,),
                Text(
                  subTitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.brightness == Brightness.dark
                        ? Colors.grey[400]
                        : AppColors.grey2,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}