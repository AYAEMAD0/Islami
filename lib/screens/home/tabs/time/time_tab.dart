import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:islami/core/utils/app_asset.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [Image.asset(AppAsset.timerBgCurve)]),
      ],
    );
  }
}
