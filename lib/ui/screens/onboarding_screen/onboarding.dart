import 'package:evently_c17/model/onboarding_model.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_routes.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:evently_c17/ui/widgets/onboarding_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../data/onboarding_data.dart';

class Onboarding extends StatefulWidget {
  Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController controller = PageController();
  int currentIndex = 0;
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        //leadingWidth: 20,
        leading: currentIndex > 0
            ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: isDark ? Colors.white : theme.primaryColor,),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),//2 ?
                      onPressed: () {
                        controller.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    icon: Icon(
                        Icons.arrow_back_ios_new,size: 15,
                        color: theme.appBarTheme.iconTheme?.color),
                    ),
                ),
              ),
            )
            : SizedBox.shrink(), // 1
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Center(child:isDark?Image.asset("assets/images/app_logo.png"): Image.asset("assets/images/Black White Minimal Modern Simple Bold Business Mag Logofff 2.png")),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).cardColor,
                side: BorderSide(color: Theme.of(context).primaryColor),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  AppRoutes.login,
                  (route) => false,
                );
              },
              child: Text("Skip", style: AppTextStyles.blue14SemiBold.copyWith(
                color: isDark ? Colors.blue : AppColors.white,),
            ),
          ),
      ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                    isLast = index == modelData.length - 1;
                  });
                },
                itemCount: modelData.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            isDark ? modelData[index].image : modelData[index].imageDark,
                            height: MediaQuery.of(context).size.height * 0.45,
                          ),
                          Center(
                            child: SmoothPageIndicator(
                              controller: controller,
                              effect: ExpandingDotsEffect(
                                dotWidth: 10,
                                dotColor: isDark ? Colors.grey: AppColors.white,
                                activeDotColor: isDark ? Colors.blue : AppColors.lightBlue,
                                dotHeight: 10,
                                spacing: 5,
                                expansionFactor: 3,
                              ),
                              count: modelData.length,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            modelData[index].title,
                            style: theme.textTheme.titleLarge,
                          ),
                          SizedBox(height: 10),
                          Text(
                            modelData[index].subTitle,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OnboardingButton(
                      text: isLast ? "Get Started" : "Next",
                      onPress: () {
                        if (isLast) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            AppRoutes.login,
                            (route) => false,
                          );
                          //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false,);
                        } else {
                          controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
