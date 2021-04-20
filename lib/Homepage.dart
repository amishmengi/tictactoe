import 'dart:async';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  bool isCross = true;
  String message;
  List<String> gameState;

  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = " ";
    });
  }

  // get image method
  // ignore: missing_return
  AssetImage getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
    }
  }

  playgame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        this.isCross = !this.isCross; //flipping
        this.checkWin();
      });
    }
  }

  checkWin() {
    if ((gameState[0] != 'empty') &&
        (gameState[1] == gameState[0]) &&
        (gameState[2] == gameState[0])) {
      setState(() {
        this.message = '${this.gameState[0]} wins';
         Timer(Duration(seconds: 3), () {
                this.resetGame();
              });
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[3] == gameState[0]) &&
        (gameState[6] == gameState[0])) {
      setState(() {
        this.message = '${this.gameState[0]} wins';
         Timer(Duration(seconds: 3), () {
                this.resetGame();
              });
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[3] == gameState[5])) {
      setState(() {
        this.message = '${this.gameState[3]} wins';
         Timer(Duration(seconds: 3), () {
                this.resetGame();
              });
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[6] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[6]} wins';
         Timer(Duration(seconds: 3), () {
                this.resetGame();
              });


      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = '${this.gameState[1]} wins';

         Timer(Duration(seconds: 3), () {
                this.resetGame();
              });
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[8] == gameState[5])) {
      setState(() {
        this.message = '${this.gameState[2]} wins';

         Timer(Duration(seconds: 3), () {
                this.resetGame();
              });
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[0] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[0]} wins';

         Timer(Duration(seconds: 3), () {
                this.resetGame();
              });
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[2] == gameState[6])) {
      setState(() {
        this.message = '${this.gameState[2]} wins';


              Timer(Duration(seconds: 3), () {
                this.resetGame();
              });

      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        this.message = 'draw';

         Timer(Duration(seconds: 3), () {
                this.resetGame();
              });
      });
      
    }
  }

  resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = " ";
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.all(20.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  itemCount: this.gameState.length,
                  itemBuilder: (context, i) => SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: MaterialButton(
                        onPressed: () {
                          this.playgame(i);
                        },
                        child: Image(
                          image: getImage(this.gameState[i]),
                        ),
                      )
                      )
                      )
                      ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              '${this.message} ',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
            color: Colors.redAccent,
            minWidth: 300.0,
            height: 50.0,
            child: Text(
              'Reset Game',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () {
              this.resetGame();
            },
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Gaddafi's World",
              style: TextStyle(fontSize: 18.0),
            ),
          )
        ],
      ),
    );
  }
}
