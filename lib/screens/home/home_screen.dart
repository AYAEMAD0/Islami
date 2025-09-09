import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/utils/app_asset.dart';
import 'package:islami/core/utils/app_color.dart';
import 'tabs/hadeth/hadeth_tab.dart';
import 'tabs/quran/quran_tab.dart';
import 'tabs/sebha/sebha_tab.dart';
import 'tabs/radio/radio_tab.dart';
import 'tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final List<Widget> screens = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  final List backgroundScreen = [
    AppAsset.quranBg,
    AppAsset.hadithBg,
    AppAsset.sebhaBg,
    AppAsset.radioBg,
    AppAsset.timeBg,
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: builtBottomTab(0, AppAsset.iconQuran),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            icon: builtBottomTab(1, AppAsset.iconHadith),
            label: "Hadeth",
          ),
          BottomNavigationBarItem(
            icon: builtBottomTab(2, AppAsset.iconSebha),
            label: "Sebha",
          ),
          BottomNavigationBarItem(
            icon: builtBottomTab(3, AppAsset.iconRadio),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            icon: builtBottomTab(4, AppAsset.iconTime),
            label: "Time",
          ),
        ],
      ),

      body: Stack(
        children: [
          Image.asset(
            backgroundScreen[currentIndex],
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: Image.asset(AppAsset.islami, height: height * 0.15),
              ),
              Expanded(child: screens[currentIndex]),
            ],
          ),
        ],
      ),
    );
  }

  Widget builtBottomTab(int index, String iconName) {
    return currentIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              color: AppColor.containerBottomColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: SvgPicture.asset(
              iconName,
              width: 22,
              height: 22,
              color: AppColor.whiteColor,
            ),
          )
        : SvgPicture.asset(
            iconName,
            width: 22,
            height: 22,
            color: AppColor.backgroundColor,
          );
  }
}
