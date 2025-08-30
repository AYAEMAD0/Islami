import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/utils/app_asset.dart';
import 'package:islami/core/utils/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final List<Widget> screens = [Quran(), Hadeth(), Sebha(), Radio(), Time()];
  @override
  Widget build(BuildContext context) {
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

      body: screens[currentIndex],
    );
  }

  Widget builtBottomTab(int index, String iconName) {
    return currentIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 17),
            decoration: BoxDecoration(
              color: AppColor.containerBottomColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.asset(
              iconName,
              width: 25,
              color: AppColor.whiteColor,
            ),
          )
        : SvgPicture.asset(
            iconName,
            width: 25,
            color: AppColor.backgroundColor,
          );
  }
}

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAsset.quranBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Image.asset(AppAsset.islami)],
        ),
      ),
    );
  }
}

class Hadeth extends StatelessWidget {
  const Hadeth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAsset.hadithBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Image.asset(AppAsset.islami)],
        ),
      ),
    );
  }
}

class Sebha extends StatelessWidget {
  const Sebha({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAsset.sebhaBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Image.asset(AppAsset.islami)],
        ),
      ),
    );
  }
}

class Radio extends StatelessWidget {
  const Radio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAsset.radioBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Image.asset(AppAsset.islami)],
        ),
      ),
    );
  }
}

class Time extends StatelessWidget {
  const Time({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAsset.timeBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Image.asset(AppAsset.islami)],
        ),
      ),
    );
  }
}
