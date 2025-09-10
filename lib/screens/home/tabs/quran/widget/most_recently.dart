import 'package:flutter/material.dart';
import 'package:islami/provider/most_recently_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_asset.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';
import '../quran_resource.dart';

class MostRecently extends StatefulWidget {
  const MostRecently({super.key});

  @override
  State<MostRecently> createState() => _MostRecentlyState();
}

class _MostRecentlyState extends State<MostRecently> {
  late MostRecentlyProvider mostRecently;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => mostRecently.readMostRecently(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    mostRecently = Provider.of<MostRecentlyProvider>(context);
    return Visibility(
      visible: mostRecently.mostRecentlyList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most Recently', style: AppStyle.bold16White),
          SizedBox(height: height * 0.01),
          // most recently scroll horizontal
          SizedBox(
            height: height * 0.16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) =>
                  SizedBox(width: width * 0.03),
              itemCount: mostRecently.mostRecentlyList.length,
              itemBuilder: (context, index) {
                return Container(
                  height: height * 0.16,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            QuranResource
                                .englishQuranSurahs[mostRecently.mostRecentlyList[index]],
                            style: AppStyle.bold24Black,
                          ),
                          SizedBox(height: height * 0.008),
                          Text(
                            QuranResource
                                .arabicAuranSuras[mostRecently.mostRecentlyList[index]],
                            style: AppStyle.bold24Black,
                          ),
                          SizedBox(height: height * 0.008),
                          Text(
                            "${QuranResource.AyaNumber[mostRecently.mostRecentlyList[index]]} Verses",
                            style: AppStyle.bold14Black,
                          ),
                        ],
                      ),
                      SizedBox(width: width * 0.03),
                      Image.asset(AppAsset.mostItemQuran),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
