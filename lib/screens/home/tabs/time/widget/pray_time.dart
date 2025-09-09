import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_asset.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../models/pray_time-model.dart';

class PrayTime extends StatelessWidget {
  const PrayTime({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Stack(
      children: [
        Image.asset(AppAsset.timerBgCurve),
        //pray
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '16 Jul, \n2024',
                style: AppStyle.bold16White,
                textAlign: TextAlign.center,
              ),
              Column(
                children: [
                  Text('Pray Time', style: AppStyle.bold20BlackOpacity70),
                  Text('Tuesday', style: AppStyle.bold20BlackOpacity90),
                ],
              ),
              Text(
                '09 Muh, \n1446',
                style: AppStyle.bold16White,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        //center
        Positioned(
          top: height * 0.11,
          left: 0,
          right: 0,
          child: CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 15/6,
              viewportFraction: 0.3,
            ),
            items: PrayTimeModel.prayerTimes.map((pray) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                decoration: BoxDecoration(
                  gradient: AppColor.gradientTime,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(pray.prayer, style: AppStyle.bold16White),
                    Text(pray.hours, style: AppStyle.bold32White),
                    Text(pray.time, style: AppStyle.bold16White),
                  ],
                ),
              );
            }).toList(),
          ),
        ),

        //bottom container next pray
        Positioned(
          bottom: 2,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 3),
              Text('Next Pray ', style: AppStyle.bold20BlackOpacity70),
              Text('- 02:32', style: AppStyle.bold20BlackOpacity90),
              SizedBox(width: width * 0.1),
              SvgPicture.asset(AppAsset.soundTime),
              Spacer(flex: 2),
            ],
          ),
        ),
      ],
    );
  }
}
