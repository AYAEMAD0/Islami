import 'package:flutter/material.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';

class SuraContent extends StatelessWidget {
   SuraContent({
    super.key,
    required this.index,
    required this.content,
    required this.isSelected,
    required this.onTap,
  });

  final int index;
  final String content;
  final bool isSelected;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(height * 0.02),
        margin: EdgeInsets.symmetric(
          horizontal: height * 0.03,
          vertical: height * 0.01,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isSelected
              ? AppColor.primaryColor
              : AppColor.transparentColor,
          border: Border.all(color: AppColor.primaryColor, width: 1.5),
        ),
        child: Text(
          '[${index + 1}] ${content}',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: isSelected
              ? AppStyle.bold20Balck
              : AppStyle.bold20Primary,
        ),
      ),
    );
  }
}
