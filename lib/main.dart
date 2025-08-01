import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flappybird/bird.dart';
import 'package:flappybird/pipe.dart';

const pipeWidth = 80.0;

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _birdY = 0.0;
  var _gameStarted = false;

  void _startGame() {
    _gameStarted = true;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        if (_birdY > -1) {
          _birdY -= 0.05;
        } else {
          _birdY += 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _gameStarted ? null : _startGame,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(-0.5, _birdY),
            child: const Bird(birdSize: 50),
          ),
          const Pipe(
            pipeHeight: 300,
            pipeWidth: pipeWidth,
            isBottomPipe: true,
            xPipeAlignment: 0.5,
          ),
          const Pipe(
            pipeHeight: 150,
            pipeWidth: pipeWidth,
            xPipeAlignment: 0.5,
          ),
          if (!_gameStarted)
            const Align(
              alignment: Alignment(0, -0.4),
              child: Text(
                'Appuie tranquillement pour jouer',
                style: TextStyle(
                  color: Color.fromARGB(255, 202, 229, 51),
                  fontSize: 20,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
