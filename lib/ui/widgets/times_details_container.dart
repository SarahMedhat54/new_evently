import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TimesDetailsContainer extends StatelessWidget {
  final String title ;
  final String subTitle ;
  const TimesDetailsContainer({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:  EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
         // border: Border.all(color: AppColors.blue, width: 1)
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.offWhite,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(Icons.calendar_month, color: AppColors.blue,),
          ),
          SizedBox(width: 8,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: AppTextStyles.black20SemiBold,),
                //SizedBox(height: 4,),
                Text(subTitle, style: AppTextStyles.grey212Regular,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
