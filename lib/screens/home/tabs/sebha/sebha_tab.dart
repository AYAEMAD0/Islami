import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_style.dart';
import '../../../../core/utils/app_asset.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int value = 0;
  double angle = 0;
  List<String> sebhaValue = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: height * 0.05),
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
          style: AppStyle.bold36White,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: height * 0.05),
        Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (counter < 33) {
                    //rotate
                    angle += math.pi / 10;
                    counter++;
                  } else {
                    counter = 0;
                    //infinity loop
                    value = (value + 1) % sebhaValue.length;
                  }
                });
              },
              child: Transform.rotate(
                angle: angle,
                child: Image.asset(AppAsset.sebhaImage, width: width * 0.90),
              ),
            ),
            Column(
              children: [
                SizedBox(height: height * 0.05),
                Text(sebhaValue[value], style: AppStyle.bold36White),
                SizedBox(height: height * 0.05),
                Text(counter.toString(), style: AppStyle.bold36White),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
