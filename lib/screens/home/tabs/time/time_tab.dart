import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        //clipper: WaveClipperTwo(reverse: true,),
        //clipper: WaveClipperTwo(),
       //clipper:  WaveClipperOne(reverse: true),
      //clipper:   WaveClipperOne(),
    child: Container(
    width: 100,
    height: 50,
    color: Colors.amber[300],
    ),
    );
    }
    }

