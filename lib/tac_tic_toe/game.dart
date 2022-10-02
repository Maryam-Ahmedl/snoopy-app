import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../helper_classes/text.dart';

class game extends StatefulWidget {
  const game({Key? key}) : super(key: key);

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {

  Future<void> _handleRefresh() async{
    return await Future.delayed(Duration(seconds: 2));
  }

  Color color= Colors.grey;
  String winner = '';
  bool playerturn = true;
  List<String> player = ['','','','','','','','',''];
  int playerOscore=0;
  int playerXscore=0;
  int filledsquares=0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: text("Tic Tac Toe", Colors.white, 25),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        backgroundColor: Colors.black54,
        color: Colors.blue,
        height: 200,
        animSpeedFactor: 2,
        showChildOpacityTransition: false,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: size.width,
                color: Colors.black54,
                child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 25,
                                    left: 25,
                                    right: 25
                                ),
                                child: Column(
                                  children: [
                                    text("player X", Colors.grey.shade400, 20),
                                    text(playerXscore.toString(), Colors.grey.shade400, 20),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 25,
                                    left: 25,
                                    right: 25
                                ),                                child: Column(
                                children: [
                                  text("player O", Colors.grey.shade400, 20),
                                  text(playerOscore.toString(), Colors.grey.shade400, 20),
                                ],
                              ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.all(15),
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          OnTap(index);
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54),
                          ),
                          child: Center(
                              child: Text(player[index],
                                style: TextStyle(color: Colors.white, fontSize: 40),)
                          ),
                        ),
                      );
                    }
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void OnTap(int index) {

    setState(() {
      if(playerturn && player[index] == ''){
        filledsquares+=1;
        player[index] = 'X';
        color = Colors.red;
      }
      else if (!playerturn && player[index] == ''){
        filledsquares+=1;
        player[index] = 'O';
        color = Colors.blue;
      }

      playerturn=!playerturn;
      whoisWinner();
    });
  }

  void whoisWinner(){
    if(player[0] == player[1] && player[0] == player[2] && player[1] != ''){
      show_Winner_Dialog(player[0]);
    }
    if(player[0] == player[3] && player[0] == player[6] && player[3] != ''){
      show_Winner_Dialog(player[0]);
    }
    if(player[0] == player[4] && player[0] == player[8] && player[4] != ''){
      show_Winner_Dialog(player[0]);
    }
    if(player[1] == player[4] && player[1] == player[7] && player[4] != ''){
      show_Winner_Dialog(player[1]);
    }
    if(player[2] == player[5] && player[2] == player[8] && player[5] != ''){
      show_Winner_Dialog(player[2]);
    }
    if(player[3] == player[4] && player[3] == player[5] && player[4] != ''){
      show_Winner_Dialog(player[3]);
    }
    if(player[6] == player[7] && player[6] == player[8] && player[7] != ''){
      show_Winner_Dialog(player[6]);
    }
    if(player[2] == player[4] && player[2] == player[6] && player[4] != ''){
      show_Winner_Dialog(player[2]);
    }

    else if(filledsquares == 9){
      showTIEDialog();
    }
  }

  void show_Winner_Dialog(String winner){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: text("Player "+winner+" is the Winner !", Colors.white, 18),
            backgroundColor: Colors.black54,
            alignment: Alignment.center,
            actions: [
              ElevatedButton(onPressed: (){
                clearboard();
                Navigator.pop(context);
              }, child: text("Play Again", Colors.white, 20)),
            ],
          );
        });

    if(winner == 'X'){
      playerXscore++;

    }
    else if(winner == 'O'){
      playerOscore++;
    }
  }

  void showTIEDialog(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: text("TIE", Colors.white, 18),
            backgroundColor: Colors.black54,
            alignment: Alignment.center,
            actions: [
              ElevatedButton(onPressed: (){
                clearboard();
                Navigator.pop(context);
              }, child: text("Play Again", Colors.white, 20)),
            ],
          );
        });

    if(winner == 'X'){
      playerXscore++;
    }
    else if(winner == 'O'){
      playerOscore++;
    }
  }

  void clearboard(){
    setState(() {
      for(int i=0 ; i<player.length ; ++i){
        player[i]='';
      }
    });

    filledsquares=0;
  }

}