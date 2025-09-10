import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/utils/app_asset.dart';
import 'package:islami/core/widget/custom_button/custom_button.dart';
import 'package:islami/core/utils/app_color.dart';
import 'package:islami/screens/home/tabs/radio/widget/item_radio.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});
  final List<String> nameReciters = const [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik shaibat Alhamed',
  ];
  final List<String> nameRadio = const [
    'Radio Ibrahim Al-Akdar',
    'Radio Al-Qaria Yassen',
    'Radio Ahmed Al-trabulsi',
    'Radio Addokali Mohammad Alalim',
  ];

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  late List<String> showValue;
  int? currentPlay = null;
  int? currentSound = null;
  bool isClickRadio = true;
  bool isClickReciters = false;

  void toggleItem(int index, String type) {
    if (type == 'play') {
      if (currentPlay == index) {
        currentPlay = null;
      } else {
        currentPlay = index;
      }
    } else if (type == 'sound') {
      if (currentSound == index) {
        currentSound = null;
      } else {
        currentSound = index;
      }
    }
  }

  void isSelectedRadio() {
    setState(() {
      currentPlay = null;
      currentSound = null;
      showValue = widget.nameRadio;
      isClickRadio = true;
      isClickReciters = false;
    });
  }

  void isSelectedReciters() {
    setState(() {
      currentPlay = null;
      currentSound = null;
      showValue = widget.nameReciters;
      isClickReciters = true;
      isClickRadio = false;
    });
  }

  @override
  void initState() {
    showValue = widget.nameRadio;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Radio',
                  onPress: isSelectedRadio,
                  isClick: isClickRadio,
                ),
              ),
              SizedBox(width: width * 0.03),
              Expanded(
                child: CustomButton(
                  text: 'Reciters',
                  onPress: isSelectedReciters,
                  isClick: isClickReciters,
                ),
              ),
            ],
          ),

          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: height * 0.02),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(top: 10),
                  height: height * 0.14,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ItemRadio(
                    name: showValue[index],
                    onPlay: () {
                      setState(() {
                        toggleItem(index, 'play');
                      });
                    },
                    isPlay: currentPlay == index,
                    isSound: currentSound == index,
                    onSound: () {
                      setState(() {
                        toggleItem(index, 'sound');
                      });
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(height: height * 0.02),
              itemCount: showValue.length,
            ),
          ),
        ],
      ),
    );
  }
}
