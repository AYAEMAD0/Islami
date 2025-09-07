import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/utils/app_asset.dart';
import 'package:islami/core/utils/app_route.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/screens/home/tabs/quran/quran_resource.dart';

class SurasItem extends StatelessWidget {
  const SurasItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context,AppRoute.suraDetailsRouteName,arguments: index);
        print('------------------------clicked');
      },
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(AppAsset.suraNumberFrame),
            Text('${index + 1}', style: AppStyle.bold20White),
          ],
        ),
        title: Text(
          QuranResource.englishQuranSurahs[index],
          style: AppStyle.bold20White,
        ),
        subtitle: Text(
          '${QuranResource.AyaNumber[index]} Verses',
          style: AppStyle.bold14White,
        ),
        trailing: Text(
          QuranResource.arabicAuranSuras[index],
          style: AppStyle.bold20White,
        ),
      ),
    );
  }
}
