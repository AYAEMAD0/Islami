import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_color.dart';

import '../../utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPress,
    required this.isClick,
  });
  final String text;
  final void Function() onPress;
  final bool isClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: isClick
            ? AppColor.primaryColor
            : AppColor.backgroundColor.withOpacity(0.7),

      ),
      child: Text(text, style: isClick? AppStyle.bold16Black:AppStyle.bold16White),
    );
  }
}
