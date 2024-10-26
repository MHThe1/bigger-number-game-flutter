import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(NumberGameApp());
}

class NumberGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NumberGame(),
    );
  }
}

class NumberGame extends StatefulWidget {
  @override
  _NumberGameState createState() => _NumberGameState();
}

class _NumberGameState extends State<NumberGame> {
  int _score = 0;
  int _num1 = 0;
  int _num2 = 0;

  void _generateNumbers() {
    setState(() {
      Random random = Random();
      _num1 = random.nextInt(100);
      _num2 = random.nextInt(100);
    });
  }

  void _chooseNumber(int chosenNum) {
    setState(() {
      if (chosenNum == (_num1 > _num2 ? _num1 : _num2)) {
        _score++;
      } else {
        _score--;
      }
      _generateNumbers();
    });
  }

  @override
  void initState() {
    super.initState();
    _generateNumbers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Text(
                  'Bigger Number Game',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => _chooseNumber(_num1),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40),
                          textStyle: TextStyle(fontSize: 34),
                        ),
                        child: Text('$_num1'),
                      ),
                      ElevatedButton(
                        onPressed: () => _chooseNumber(_num2),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40),
                          textStyle: TextStyle(fontSize: 34),
                        ),
                        child: Text('$_num2'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Text(
                  'Score: $_score',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
