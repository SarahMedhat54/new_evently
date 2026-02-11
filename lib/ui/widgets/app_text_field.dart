import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hint;
  final bool isPassword;
  final int? minLines;
  final TextEditingController? controller;

  const AppTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    required this.hint,
    this.isPassword = false,
    this.controller,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Color borderColor = theme.colorScheme.outline;
    var isDark = theme.brightness == Brightness.dark;

    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: borderColor,
        width: 1,
      ),
    );

    return TextField(
      controller: controller,
      minLines: minLines ?? 1,
      maxLines: isPassword ? 1 : (minLines ?? 1),
      obscureText: isPassword,
      style:theme.textTheme.labelSmall ,
      decoration: InputDecoration(
        suffixIcon: suffixIcon != null
            ? Padding(padding: const EdgeInsets.symmetric(horizontal: 12), child: suffixIcon)
            : null,
        prefixIcon: prefixIcon != null
            ? Padding(padding: const EdgeInsets.symmetric(horizontal: 12), child: prefixIcon)
            : null,

        hintText: hint,
        hintStyle: AppTextStyles.grey14Regular.copyWith(
          color: isDark ? AppColors.lightBlue:  Colors.white.withOpacity(0.7),
        ),

        border: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: AppColors.blue, width: 1.5),
        ),
        enabledBorder: border,
        filled: true,
        fillColor: theme.cardColor,
        suffixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 48),
        prefixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 48),
      ),
    );
  }
}