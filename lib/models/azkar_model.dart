import 'package:islami/core/utils/app_asset.dart';

class AzkarModel{
  String image;
  String text;
  AzkarModel({required this.image,required this.text});

  static List<AzkarModel>azkarList=[
    AzkarModel(image: AppAsset.azkarTime1, text: 'Evening Azkar'),
    AzkarModel(image: AppAsset.azkarTime2, text: 'Morning Azkar'),
    AzkarModel(image: AppAsset.azkarTime3, text: 'Waking Azkar'),
    AzkarModel(image: AppAsset.azkarTime4, text: 'Sleeping Azkar'),
  ];
}