import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/core/utils/app_asset.dart';
import 'package:islami/core/utils/app_color.dart';
import 'package:islami/core/utils/app_route.dart';
import 'package:islami/models/details_onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final GlobalKey<IntroductionScreenState> key =
      GlobalKey<IntroductionScreenState>();
  final model = DetailsOnboardingModel.onBoardingScreens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: IntroductionScreen(
          key: key,
          pages: List.generate(model.length, (index) {
            return PageViewModel(
              title: '',
              bodyWidget: designOnBoardingScreens(model[index]),
            );
          }),


        showBackButton: true,
          back: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Back',
              style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          showNextButton: true,
          next: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'Next',
              style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          showDoneButton: true,
          done: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'Finish',
              style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          onDone: () {
            Navigator.pushReplacementNamed(context, AppRoute.homeRouteName);
          },

          dotsContainerDecorator: const ShapeDecoration(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(),
          ),
          dotsDecorator: DotsDecorator(
            color: AppColor.grayColor,
            activeColor: AppColor.primaryColor,
            activeSize: const Size(18, 7),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(27),
            ),
          ),
        ),
      ),
    );
  }
}


Widget designOnBoardingScreens(DetailsOnboardingModel model) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(AppAsset.islami, height: 130),
      const SizedBox(height: 25),
      Image.asset(model.image, height: 250),
      const SizedBox(height: 20),
      (model.text != null)
          ? Text(
              model.text!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )
          : const SizedBox(height: 40),
      const SizedBox(height: 30),
      Text(
        model.desc,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.primaryColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
