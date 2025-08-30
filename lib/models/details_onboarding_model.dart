import 'package:islami/core/utils/app_asset.dart';

class DetailsOnboardingModel {
  String image;
  String? text;
  String desc;
  DetailsOnboardingModel({
    required this.image,
    this.text,
    required this.desc,
  });

  static List<DetailsOnboardingModel> onBoardingScreens = [
    DetailsOnboardingModel(
      image: AppAsset.image1,
      desc: 'Welcome To Islami',
    ),
    DetailsOnboardingModel(
      image: AppAsset.image2,
      desc: 'We Are Very Excited To Have You In Our Community',
      text: 'Welcome To Islami',
    ),
    DetailsOnboardingModel(
      image: AppAsset.image3,
      desc: 'Read, and your Lord is the Most Generous',
      text: 'Reading the Quran',
    ),
    DetailsOnboardingModel(
      image: AppAsset.image4,
      desc: 'Praise the name of your Lord, the Most High',
      text: 'Bearish',
    ),
    DetailsOnboardingModel(
      image: AppAsset.image5,
      desc:
          'You can listen to the Holy Quran Radio through the application for free and easily',
      text: 'Holy Quran Radio',
    ),
  ];
}
