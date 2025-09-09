import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/utils/app_route.dart';

import '../../../../core/utils/app_asset.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_style.dart';
import '../../../../models/hadeth_model.dart';

class HadethItem extends StatefulWidget {
  const HadethItem({super.key, required this.index});
  final int index;

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  HadethModel? hadethModel;

  @override
  void initState() {
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoute.hadethDetailsRouteName,arguments: hadethModel);
      },
      child: Container(
        height: height * 0.70,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: width * 0.01),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage(AppAsset.hadethBgImage,),
            fit: BoxFit.scaleDown,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: height*0.009,
              left: width*0.02,
              child: Image.asset(AppAsset.hadethLeftCorner),
            ),
            Positioned(
              top: height*0.009,
              right: width*0.02,
              child: Image.asset(AppAsset.hadethRightCorner),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(AppAsset.hadethBgBottom,fit: BoxFit.cover,height: height*0.1,),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.09, vertical: height * 0.05),
              child: hadethModel == null
                  ? Center(
                child: CircularProgressIndicator(color: AppColor.backgroundColor),
              )
                  : Column(
                children: [
                  Text(
                    hadethModel!.title,
                    textAlign: TextAlign.center,
                    style: AppStyle.bold24Black,
                    maxLines: 2,
                  ),
                  SizedBox(height: height * 0.02),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadethModel!.content,
                        textAlign: TextAlign.center,
                        style: AppStyle.bold16Black,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadHadethFile() async {
    String hadeth = await rootBundle.loadString(
      'assets/files/hadith/h${widget.index}.txt',
    );
    int indexFileLine = hadeth.indexOf('\n');
    String title = hadeth.substring(0, indexFileLine).trim();
    String content = hadeth.substring(indexFileLine + 1).trim();
    setState(() {
      hadethModel = HadethModel(title: title, content: content);
    });
  }
}
