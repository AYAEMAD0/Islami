import 'package:flutter/material.dart';
import '../../../../../core/utils/app_style.dart';

class SuraContentWithoutLine extends StatelessWidget {
  const SuraContentWithoutLine({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width*0.04),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
                  content,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: AppStyle.bold20Primary,
            ),

          ],
        ),
      ),
    );
  }
}
