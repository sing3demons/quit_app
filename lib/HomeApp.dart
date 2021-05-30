import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp() : super();

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final _height = 80.0;
  int index = 1;
  int score = 0;
  Map<int, Map<String, dynamic>> quiz = {
    1: {"q": "แมวเป็นสัตว์เลี้ยงลูกด้วยนม มี 4 ขา", "a": true},
    2: {"q": "ดาวเคราะห์ที่อยู่ใกล้ดวงอาทิตย์ที่สุดคือดาวเสาร์", "a": false},
    3: {
      "q": "สารอาหารที่มีผลต่อการสร้างกล้ามเนื้อมากที่สุดคือโปรตีน",
      "a": true
    },
  };

  void checkAnswer(bool q) {
    if (q == quiz[index]!['a']) score = score + 1;

    if (index == quiz.length) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Congratulations!'),
          content: Text('Your scose is $score out of ${quiz.length}'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  score = 0;
                  setState(() {
                    index = 1;
                  });
                },
                child: Text('Try Again'))
          ],
        ),
      );
      return;
    }

    setState(() {
      index = index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              '${quiz[index]!['q']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            alignment: Alignment.center,
          ),
        ),
        Container(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: _height,
                  color: Colors.green,
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.check),
                    onPressed: () {
                      checkAnswer(true);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: _height,
                  color: Colors.red,
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.close),
                    onPressed: () {
                      checkAnswer(false);
                    },
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
