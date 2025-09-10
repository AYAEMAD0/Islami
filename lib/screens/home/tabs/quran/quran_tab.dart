import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/utils/app_color.dart';
import 'package:islami/screens/home/tabs/quran/quran_resource.dart';
import '../../../../core/utils/app_asset.dart';
import '../../../../core/utils/app_style.dart';
import 'widget/most_recently.dart';
import 'widget/suras_item.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  //show in start
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: height * .02,
        vertical: height * .01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //text field search
          TextField(
            cursorColor: AppColor.primaryColor,
            cursorHeight: height * 0.03,
            cursorWidth: width * 0.007,
            style: AppStyle.bold16White,
            onChanged: (searchKey) {
              searchBySearchKey(searchKey);
            },
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
          //most recently
          MostRecently(),

          SizedBox(height: height * 0.02),
          Text('Suras List', style: AppStyle.bold16White),
          SizedBox(height: height * 0.017),
          //Suras List 114
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: height * 0.01),
              itemCount: filterList.length,
              separatorBuilder: (context, index) => Divider(
                color: AppColor.whiteColor,
                endIndent: width * 0.08,
                indent: width * 0.11,
                thickness: 1.5,
              ),
              itemBuilder: (context, index) =>
                  SurasItem(index: filterList[index]),
            ),
          ),
        ],
      ),
    );
  }

  InputBorder buildTextField() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColor.primaryColor, width: 1.5),
    );
  }

  void searchBySearchKey(String searchKey) {
    List<int> filteredResultList = [];

    for (int i = 0; i < QuranResource.englishQuranSurahs.length; i++) {
      if (QuranResource.englishQuranSurahs[i].toLowerCase().contains(
        searchKey.toLowerCase(),
      )) {
        filteredResultList.add(i);
      } else if (QuranResource.arabicAuranSuras[i].contains(searchKey)) {
        filteredResultList.add(i);
      }
    }
    filterList = filteredResultList;
    setState(() {});
  }
}
