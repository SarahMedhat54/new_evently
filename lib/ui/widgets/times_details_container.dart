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
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.offWhite,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(Icons.calendar_month_outlined, color: AppColors.blue,),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.black20SemiBold,),
              SizedBox(height: 4,),
              Text(subTitle, style: AppTextStyles.grey14Regular,)
            ],
          )
        ],
      ),
    );
  }
}
