import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c17/l10n/app_localizations.dart';
import 'package:evently_c17/ui/model/user_dm.dart';
import 'package:evently_c17/ui/utils/app_assets.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_dialogs.dart';
import 'package:evently_c17/ui/utils/app_routes.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:evently_c17/ui/widgets/app_textfield.dart';
import 'package:evently_c17/ui/widgets/evently_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                controller: emailController,
              ),
              SizedBox(height: 16),
              AppTextField(
                hint: localizations.passwordHint,
                prefixIcon: SvgPicture.asset(AppAssets.icLockSvg),
                controller: passwordController,
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
      try {
        showLoading(context);
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        UserDM.currentUser = await getUserFromFirestore(credential.user!.uid);
        Navigator.pop(context); // hide loading
        Navigator.push(context, AppRoutes.navigation);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context); // hide loading
        var message = e.message ?? "Something went wrong please try wrong";
        showMessage(context, message, title: "Error", posButtonText: "ok");
      } catch (e) {
        print(e);
      }
    },
  );

  Future<UserDM> getUserFromFirestore(String id) async {
    var usersCollection = FirebaseFirestore.instance.collection("users");
    var userDoc = usersCollection.doc(id);
    DocumentSnapshot snapshot = await userDoc.get();
    Map map = snapshot.data() as Map;
    return UserDM(
      id: id,
      name: map["name"],
      address: map["address"],
      phoneNumber: map["phoneNumber"],
      email: map["email"],
    );
  }
}
