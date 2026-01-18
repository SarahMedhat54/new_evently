import 'package:evently_c17/ui/utils/app_assets.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_dialogs.dart';
import 'package:evently_c17/ui/utils/app_routes.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:evently_c17/ui/widgets/app_text_field.dart';
import 'package:evently_c17/ui/widgets/evently_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              buildLoginButton(),
              SizedBox(height: 48),
              InkWell(
                onTap: () {
                  Navigator.push(context, AppRoutes.register);
                },
                child: Row(
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

  EventlyButton buildLoginButton() => EventlyButton(
    text: "Login",
    onPress: () async {
      showLoading(context);
      await Future.delayed(Duration(seconds: 1));
      Navigator.pop(context);
      showMessage(
        context,
        "Please try again later",
        posText: "ok",
        onPosClick: () {},
      );
    },
  );
}
