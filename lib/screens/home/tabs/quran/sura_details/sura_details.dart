import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/utils/app_asset.dart';
import 'package:islami/core/utils/app_color.dart';
import 'package:islami/core/utils/app_route.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/screens/home/tabs/quran/quran_resource.dart';
import 'package:islami/screens/home/tabs/quran/sura_details/sura_content.dart';
import 'package:provider/provider.dart';
import '../../../../../provider/most_recently_provider.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> suraVerses = [];
  int? selectedVerseIndex;

  late MostRecentlyProvider mostRecently;

  @override
  void dispose() {
    super.dispose();
    mostRecently.readMostRecently();
  }

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    double height = MediaQuery.of(context).size.height;

    mostRecently=Provider.of<MostRecentlyProvider>(context);

    if (suraVerses.isEmpty) {
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
              Navigator.pushReplacementNamed(context, AppRoute.suraDetailsWithoutLineRouteName,arguments: index);
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
          suraVerses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.03),
                    Text(
                      QuranResource.arabicAuranSuras[index],
                      style: AppStyle.bold24Primary,
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.only(top: height * 0.04),
                        itemBuilder: (context, index) => SuraContent(
                          content: suraVerses[index],
                          index: index,
                          isSelected: selectedVerseIndex == index,
                          onTap: () {
                            setState(() {
                              selectedVerseIndex = index;
                            });
                          },
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 5),
                        itemCount: suraVerses.length,
                      ),
                    ),
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
    suraVerses = suraLines;
    setState(() {});
  }
}
