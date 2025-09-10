import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_asset.dart';
import 'package:islami/core/utils/app_color.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/models/hadeth_model.dart';

class HadethDetails extends StatefulWidget {
  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    HadethModel hadeth =
    ModalRoute.of(context)!.settings.arguments as HadethModel;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        forceMaterialTransparency:
        true, //doesn't change color in app bar(scroll)
      ),
      body: Stack(
        children: [
          Image.asset(
            AppAsset.frameSuraDetails,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.06),
              Text(hadeth.title, style: AppStyle.bold24Primary,maxLines: 2,),
              SizedBox(height: height * 0.06),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.09),
                    child: Column(
                      children: [
                        Text(
                          hadeth.content,
                          textAlign: TextAlign.center,
                          style: AppStyle.bold20Primary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.12),
            ],
          ),
        ],
      ),
    );
  }
}
