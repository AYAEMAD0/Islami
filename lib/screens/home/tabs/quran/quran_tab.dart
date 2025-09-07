import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/utils/app_color.dart';
import 'package:islami/screens/home/tabs/quran/quran_resource.dart';
import '../../../../core/utils/app_asset.dart';
import '../../../../core/utils/app_style.dart';
import 'widget/most_recently_item.dart';
import 'widget/suras_item.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:  height * .02,vertical:height * .01 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //text field search
          TextField(
            cursorColor: AppColor.primaryColor,
            cursorHeight: height * 0.03,
            cursorWidth: width * 0.006,
            style: AppStyle.bold16White,
            decoration: InputDecoration(
              hintText: 'Sura Name',
              hintStyle: AppStyle.bold16White,
              contentPadding: EdgeInsets.symmetric(horizontal: height * .03),
              prefixIcon: Padding(
                padding: EdgeInsets.all(height * .02),
                child: SvgPicture.asset(AppAsset.searchQuran),
              ),
              border: buildTextField(),
              focusedBorder: buildTextField(),
              enabledBorder: buildTextField(),
            ),
          ),
          SizedBox(height: height * 0.03),
          Text('Most Recently', style: AppStyle.bold16White),
          SizedBox(height: height * 0.01),
          // most recently scroll horizontal
          SizedBox(
            height: height * 0.16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: width * 0.03),
              itemCount: 5,
              itemBuilder: (context, index) => MostRecentlyItem(),
            ),
          ),
          SizedBox(height: height * 0.02),
          Text('Suras List', style: AppStyle.bold16White),
          SizedBox(height: height * 0.017),
          //Suras List 114
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: height*0.01),
              itemCount: QuranResource.arabicAuranSuras.length,
              separatorBuilder: (context, index) => Divider(
                color: AppColor.whiteColor,
                endIndent: width * 0.08,
                indent: width * 0.11,
                thickness: 1.5,
              ),
              itemBuilder: (context, index) =>SurasItem(index:index),
            ),
          ),
        ],
      ),
    );
  }

  InputBorder buildTextField() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColor.primaryColor,width: 1.5),
    );
  }
}
