import 'package:evently_c17/l10n/app_localizations.dart';
import 'package:evently_c17/ui/utils/app_assets.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_dialogs.dart';
import 'package:evently_c17/ui/utils/app_routes.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:evently_c17/ui/widgets/app_textfield.dart';
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
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.appLogo),
              Text(
                localizations.loginScreenHeader,
                style: AppTextStyles.blue24SemiBold,
              ),
              SizedBox(height: 16),
              AppTextField(
                hint: localizations.emailHint,
                prefixIcon: SvgPicture.asset(AppAssets.icEmailSvg),
              ),
              SizedBox(height: 16),
              AppTextField(
                hint: localizations.passwordHint,
                prefixIcon: SvgPicture.asset(AppAssets.icLockSvg),
                isPassword: true,
              ),
              SizedBox(height: 8),
              Text(
                localizations.forgetPassword,
                style: AppTextStyles.blue14SemiBold.copyWith(
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 48),
              buildLoginButton(),
              SizedBox(height: 48),
              InkWell(
                onTap: () {
                  Navigator.push(context, AppRoutes.register);
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: localizations.dontHaveAccount,
                        style: AppTextStyles.grey14Regular,
                      ),
                      TextSpan(
                        text: localizations.signUp,
                        style: AppTextStyles.blue14SemiBold.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24),
              Text(
                localizations.or,
                style: AppTextStyles.blue14SemiBold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              EventlyButton(
                text: localizations.loginWithGoogle,
                onClick: () {},
                textColor: AppColors.blue,
                backgroundColor: AppColors.white,
                icon: Icon(Icons.mail, color: AppColors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }

  EventlyButton buildLoginButton() => EventlyButton(
    text: AppLocalizations.of(context)!.login,
    onClick: () async {
      showLoading(context);
      await Future.delayed(Duration(seconds: 1));
      if (mounted) {
        Navigator.pop(context);
        showMessage(
          context,
          "My first message",
          title: "Error",
          posButtonText: "yes",
          negButtonText: "no",
          onPosClick: () {},
        );
      }
    },
  );
}
