import 'package:flutter/cupertino.dart';
import 'package:islami/core/utils/app_asset.dart';
import 'package:islami/core/utils/app_color.dart';
import 'package:islami/core/utils/app_style.dart';

class MostRecentlyItem extends StatelessWidget {
  const MostRecentlyItem({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.16,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Al-Anbiya', style: AppStyle.bold24Black),
              SizedBox(height: height * 0.008),
              Text('الأنبياء', style: AppStyle.bold24Black),
              SizedBox(height: height * 0.008),
              Text('112 Verses', style: AppStyle.bold14Black),
            ]),
            Image.asset(AppAsset.mostItemQuran),


        ],
      ),
    );
  }
}
