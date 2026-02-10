import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {
  final String text;

  final VoidCallback onPress;

  OnboardingButton({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    var themeStyle = Theme.of(context).elevatedButtonTheme.style;
    return ElevatedButton(
      style: themeStyle,
      onPressed:onPress,
      child: Text(text, style: AppTextStyles.white18Medium),
    );
  }
}
