import 'package:cloud_firestore/cloud_firestore.dart';
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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.appLogo),
              Text("Create your account", style: AppTextStyles.blue24SemiBold),
              SizedBox(height: 16),
              AppTextField(
                hint: "Enter your name",
                prefixIcon: SvgPicture.asset(AppAssets.icPersonSvg),
                controller: nameController,
              ),
              AppTextField(
                hint: "Enter your address",
                prefixIcon: SvgPicture.asset(AppAssets.icPersonSvg),
                controller: addressController,
              ),
              AppTextField(
                hint: "Enter your phone number",
                prefixIcon: SvgPicture.asset(AppAssets.icPersonSvg),
                controller: phoneNumberController,
              ),
              SizedBox(height: 16),
              AppTextField(
                hint: "Enter your email",
                prefixIcon: SvgPicture.asset(AppAssets.icEmailSvg),
                controller: emailController,
              ),
              SizedBox(height: 16),
              AppTextField(
                hint: "Enter your password",
                prefixIcon: SvgPicture.asset(AppAssets.icLockSvg),
                controller: passwordController,
                isPassword: true,
              ),
              SizedBox(height: 16),
              AppTextField(
                hint: "Confirm your password",
                prefixIcon: SvgPicture.asset(AppAssets.icLockSvg),
                isPassword: true,
              ),
              SizedBox(height: 48),
              buildRegisterButton(),
              SizedBox(height: 48),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: AppTextStyles.grey14Regular,
                      ),
                      TextSpan(
                        text: "Sign in",
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
                "Or",
                style: AppTextStyles.blue14SemiBold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              EventlyButton(
                text: "Login with google",
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

  EventlyButton buildRegisterButton() => EventlyButton(
    text: "Register",
    onClick: () async {
      try {
        showLoading(context);
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        UserDM.currentUser = UserDM(
          id: credential.user!.uid,
          name: nameController.text,
          address: addressController.text,
          phoneNumber: phoneNumberController.text,
          email: emailController.text,
        );
        createUserInFirestore(UserDM.currentUser!);
        Navigator.pop(context); // hide loading
        Navigator.push(context, AppRoutes.navigation);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context); // hide loading
        var message = "";
        if (e.code == 'weak-password') {
          message = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          message = 'The account already exists for that email.';
        } else {
          message = "Something went wrong please try again later";
        }
        showMessage(context, message, title: "Error", posButtonText: "ok");
      } catch (e) {
        print(e);
      }
    },
  );

  void createUserInFirestore(UserDM user) {
    var usersCollection = FirebaseFirestore.instance.collection("users");
    var emptyDoc = usersCollection.doc(user.id);
    emptyDoc.set({
      "id": user.id,
      "name": user.name,
      "email": user.email,
      "address": user.address,
      "phoneNumber": user.phoneNumber,
      "favoriteEventIds": [],
    });
    // usersCollection.add({

    // });
  }
}

// json -> java script object notation; Map<String, dynamic>
