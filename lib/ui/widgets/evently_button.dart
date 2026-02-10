import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart' show AppColors;

class EventlyButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? icon;
  final bool enableBorder;
  final VoidCallback onPress;

  const EventlyButton({
    super.key,
    required this.text,
    required this.onPress,
    this.textColor = AppColors.white,
    this.backgroundColor = AppColors.blue,
    this.enableBorder = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[icon!, SizedBox(width: 12)],
          Text(
            text,
            style: AppTextStyles.white18Medium.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}