import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_asset.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';

class ItemRadio extends StatefulWidget {
  const ItemRadio({
    super.key,
    required this.name,
    required this.onPlay,
    required this.isPlay,
    required this.onSound,
    required this.isSound,
  });
  final String name;
  final void Function() onPlay;
  final bool isPlay;
  final void Function() onSound;
  final bool isSound;

  @override
  State<ItemRadio> createState() => _ItemRadioState();
}

class _ItemRadioState extends State<ItemRadio> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          bottom: widget.isPlay ? -30 : 2,
          right: widget.isPlay ? -13 : 0,
          left: widget.isPlay ? -13 : 0,
          child: Image.asset(
            widget.isPlay ? AppAsset.bgSoundPlayRadio : AppAsset.bgNotPlayRadio,
            color: AppColor.backgroundColor.withOpacity(0.7),
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ),

        Column(
          children: [
            Text(widget.name, style: AppStyle.bold20Balck),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: widget.onPlay,
                  child: widget.isPlay
                      ? SvgPicture.asset(AppAsset.pauseSoundRadio)
                      : SvgPicture.asset(AppAsset.playSoundRadio),
                ),
                SizedBox(width: width * 0.06),
                InkWell(
                  onTap: widget.onSound,
                  child: widget.isSound
                      ? SvgPicture.asset(AppAsset.soundLowRadio)
                      : SvgPicture.asset(AppAsset.soundHighRadio),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
