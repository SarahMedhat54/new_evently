import 'package:evently_c17/fire_store/firebase.dart';
import 'package:evently_c17/l10n/app_localizations.dart';
import 'package:evently_c17/model/user_dm.dart';
import 'package:evently_c17/ui/utils/app_assets.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_dialogs.dart';
import 'package:evently_c17/ui/utils/app_routes.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:evently_c17/ui/widgets/app_text_field.dart';
import 'package:evently_c17/ui/widgets/evently_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential?> signInWithGoogle() async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  if (googleUser == null) {
    return null;
  }
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

class LoginScreen extends StatefulWidget {
  static String id = 'Login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var isDark = Theme.of(context).brightness == Brightness.dark;
    var localization = AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              isDark
                  ? Image.asset("assets/images/app_logo.png")
                  : Image.asset(
                      "assets/images/Black White Minimal Modern Simple Bold Business Mag Logofff 2.png",
                    ),
              SizedBox(height: 48),
              Text(
                localization.loginHeaderMessage,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontSize: 24),
              ),
              SizedBox(height: 24),
              AppTextField(
                controller: emailController,
                hint: localization.emailHint,
                prefixIcon: SvgPicture.asset(AppAssets.icEmailSvg),
              ),
              SizedBox(height: 16),
              AppTextField(
                controller: passwordController,
                hint: localization.passwordHint,
                suffixIcon: SvgPicture.asset(AppAssets.icEyeClosedSvg),
                prefixIcon: SvgPicture.asset(AppAssets.icLockSvg),
              ),
              SizedBox(height: 8),
              Text(
                localization.forgetPassword,
                textAlign: TextAlign.end,
                style: isDark?AppTextStyles.blue14SemiBold.copyWith(
                  decoration: TextDecoration.underline,):AppTextStyles.lightBlue14Regular.copyWith(
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
                      localization.dontHaveAccount,
                      style: AppTextStyles.grey14Regular,
                    ),
                    Text(
                      localization.signUp,
                      style: isDark?AppTextStyles.blue14SemiBold.copyWith(
                        decoration: TextDecoration.underline,):AppTextStyles.lightBlue14Regular.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Text(
                localization.or,
                textAlign: TextAlign.center,
                style: AppTextStyles.blue14SemiBold,
              ),
              SizedBox(height: 32),
              EventlyButton(

                text: localization.googleLogin,

                onPress: () async {
                  // signInWithGoogle();
                  showLoading(context);
                  var user = await signInWithGoogle();
                  Navigator.pop(context);
                  if (user != null) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      AppRoutes.navigation,
                      (route) => false,
                    );
                  }
                },
                backgroundColor: isDark?AppColors.white: Colors.transparent,
                icon: Icon(Icons.g_mobiledata),
              ),
            ],
          ),
        ),
      ),
    );
  }

  EventlyButton buildLoginButton() => EventlyButton(
    text: AppLocalizations.of(context)!.login,
    onPress: () async {
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
        showMessage(context, message, title: "Error", posText: "ok");
      } catch (e) {
        print(e);
      }
    },
  );

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }
}
