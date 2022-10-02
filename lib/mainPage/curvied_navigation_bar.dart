import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../add_mode/add_status.dart';
import '../main_pages/homepage.dart';
import '../main_pages/mypage.dart';
import '../main_pages/pageView/proverbs_page.dart';
import '../main_pages/water_pages/water_ui.dart';


class page extends StatefulWidget {
  const page({Key? key}) : super(key: key);

  @override
  State<page> createState() => _pageState();
}

class _pageState extends State<page> {
  final items = [
    Icon(Icons.water_drop_rounded,color:Colors.black54,size: 30),
    Icon(Icons.home_filled,size: 30,color:Colors.black54,),
    Icon(Icons.add,size: 40,color:Colors.white,),
    Icon(Icons.auto_stories_outlined,size: 30,color:Colors.black54,),
    Icon(Icons.person_outline_sharp,size: 30,color:Colors.black54,),
  ];
  int index = 1;
  final NavigateKey = GlobalKey<CurvedNavigationBarState>();

  final screens = [
    water_ui(),
    homepage(),
    add_status(),
    proverbs_page(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromRGBO(131, 153, 168,1.0),
        color:  Color.fromRGBO(219, 192, 158,1.0),
        key: NavigateKey,
        height: 50,
        items: items,
        index: 1,
        onTap: (index){
          setState(() {
            this.index = index;
          });
        },
      ),
      body: screens[index],
    );
  }
}
