import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/utils/app_asset.dart';
import 'package:islami/core/utils/app_color.dart';
import 'package:islami/core/utils/app_route.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/screens/home/tabs/quran/quran_resource.dart';
import 'package:islami/screens/home/tabs/quran/sura_details_without_line/sura_content_without_line.dart';



class SuraDetailsWithoutLine extends StatefulWidget {
  const SuraDetailsWithoutLine({super.key});

  @override
  State<SuraDetailsWithoutLine> createState() => _SuraDetailsWithoutLineState();
}

class _SuraDetailsWithoutLineState extends State<SuraDetailsWithoutLine> {
  String suraContent = '';

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    double height = MediaQuery.of(context).size.height;

    if (suraContent.isEmpty) {
      loadSura(index);
    }

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        forceMaterialTransparency:
        true, //doesnot change color in app bar(scroll)
        title: Text(QuranResource.englishQuranSurahs[index]),
        centerTitle: true,
        actions: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: height*0.02),
            child: IconButton(onPressed: (){
              Navigator.pushReplacementNamed(context, AppRoute.suraDetailsRouteName,arguments: index);
            },icon:Icon(Icons.camera_outlined) ),
          )
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            AppAsset.frameSuraDetails,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          suraContent.isEmpty
              ? Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.03),
              Text(
                QuranResource.arabicAuranSuras[index],
                style: AppStyle.bold24Primary,
              ),
              SizedBox(height: height * 0.06),
              Expanded(child: SuraContentWithoutLine(content: suraContent)),
              SizedBox(height: height * 0.12),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> loadSura(int index) async {
    String suraFile = await rootBundle.loadString(
      'assets/files/suras/${index + 1}.txt',
    );
    List<String> suraLines = suraFile.split('\n');
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i]+='[${i+1}] ';
    }


    suraContent = suraLines.join();
    setState(() {});
  }
}
