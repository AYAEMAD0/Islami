import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_color.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/models/azkar_model.dart';
import 'package:islami/screens/home/tabs/time/widget/pray_time.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(left:  height * 0.02,right:height * 0.02,bottom: height * 0.02,top: height * 0.01 ),
      child: Column(
        children: [
          PrayTime(),
          SizedBox(height: height * 0.02),
          Align(
            alignment: Alignment.topLeft,
            child: Text(' Azkar', style: AppStyle.bold16WhiteDark),
          ),
          SizedBox(height: height * 0.01),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5/6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
              ),
              itemCount: AzkarModel.azkarList.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColor.primaryColor,width: 2),
                  ),
                  child: Column(
                    children: [
                      Image.asset(AzkarModel.azkarList[index].image),
                      Text(AzkarModel.azkarList[index].text,style: AppStyle.bold20White,),
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
