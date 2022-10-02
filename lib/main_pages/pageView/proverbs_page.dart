import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

import 'card.dart';

class proverbs_page extends StatefulWidget {
  const proverbs_page({Key? key}) : super(key: key);

  @override
  State<proverbs_page> createState() => _proverbs_pageState();
}

class _proverbs_pageState extends State<proverbs_page> {

  final transforms = [
    AccordionTransformer(),
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: TransformerPageView(
        loop: true,
        duration: Duration(seconds: 1),
        scrollDirection: Axis.vertical,
        curve: Curves.easeInOutBack,
        transformer: transforms[0],
        itemCount: proverbs.urlImages.length,
        itemBuilder: (context,index) {
          final urlImages = proverbs.urlImages[index];
          final words = proverbs.subtitles[index];

          return card(urlImage: urlImages, subtitles: words);
        },
      ),
    );
  }
}

class proverbs{
  static const List<String> subtitles = [
    'Absence makes the heart grow fonder',//1
    'Actions speak louder than words',//2
    'A journey of a thousand miles begins with a single step',//3
    'All good things must come to an end',//4
    'A picture is worth a thousand words',//5
    'If you want something done right, you have to do it yourself',//6
    'Keep your friends close, and your enemies closer',//7
    'People who live in glass houses should not throw stones',//8
    'We may travel far and wide, but wisdom and wit will always ring true. \n These sayings from countries all over this beautiful world reveal \n important lessons and universal truths for us all'//10
        'Coffee and love taste best when hot.',//11
    'Turn your face toward the sun and the shadows fall behind you.',//14
    'Some men go through a forest and see no firewood.',//15
    'A bird does not sing because it has an answer. It sings because it has a song.',//16
    'Even though you know a thousand things, ask the man who knows one.',//17
    'It’s not enough to learn how to ride, you must also learn how to fall.',//18
    'If you can walk you can dance. If you can talk you can sing.',//19
  ];

  static const List<String> urlImages = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
    'assets/7.jpg',
    'assets/12.jpg',
    'assets/13.jpg',
    'assets/15.jpg',
    'assets/16.jpg',
    'assets/18.jpg',
    'assets/19.jpg',
    'assets/20.jpg',
    'assets/21.jpg',
  ];
}

class AccordionTransformer extends PageTransformer {
  @override
  Widget transform(Widget child, TransformInfo info) {
    double position = info.position;
    if (position < 0.0) {
      return new Transform.scale(
        scale: 1 + position,
        alignment: Alignment.topRight,
        child: child,
      );
    } else {
      return new Transform.scale(
        scale: 1 - position,
        alignment: Alignment.bottomLeft,
        child: child,
      );
    }
  }
}
