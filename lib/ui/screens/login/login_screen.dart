import 'package:evently_c17/ui/utils/app_assets.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:evently_c17/ui/widgets/app_text_field.dart';
import 'package:evently_c17/ui/widgets/evently_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.appLogo),
              SizedBox(height: 48),
              Text(
                "Login to your account",
                style: AppTextStyles.blue24SemiBold,
              ),
              SizedBox(height: 24),
              AppTextField(
                hint: "Enter your email",
                prefixIcon: SvgPicture.asset(AppAssets.icEmailSvg),
              ),
              SizedBox(height: 16),
              AppTextField(
                hint: "Enter your password",
                suffixIcon: SvgPicture.asset(AppAssets.icEyeClosedSvg),
                prefixIcon: SvgPicture.asset(AppAssets.icLockSvg),
              ),
              SizedBox(height: 8),
              Text(
                "Forgot password?",
                textAlign: TextAlign.end,
                style: AppTextStyles.blue14SemiBold.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 48),
              EventlyButton(text: "Login", onPress: () {}),
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont have an account?  ",
                    style: AppTextStyles.grey14Regular,
                  ),
                  Text(
                    "Sign up",
                    style: AppTextStyles.blue14SemiBold.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Text(
                "Or",
                textAlign: TextAlign.center,
                style: AppTextStyles.blue14SemiBold,
              ),
              SizedBox(height: 32),
              EventlyButton(
                text: "Login with Google",
                onPress: () {},
                backgroundColor: AppColors.white,
                textStyle: AppTextStyles.blue18Medium,
                icon: Icon(Icons.g_mobiledata),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
