import 'package:flutter/material.dart';

import '../../helper_classes/text.dart';


class card extends StatelessWidget {
  const card({Key? key,required this.urlImage,required this.subtitles}) : super(key: key);

  final String urlImage;
  final String subtitles;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
        image: DecorationImage(
            image: AssetImage(urlImage),
            fit: BoxFit.cover,
            colorFilter:
            ColorFilter.mode(Colors.black45, BlendMode.darken)),
      ),
      child: Center(
          child: text(subtitles, Colors.white, 22)
      ),
    );
  }
}
