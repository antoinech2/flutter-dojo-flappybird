import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  const Bird({
    Key? key,
    required this.birdSize,
  }) : super(key: key);

  final double birdSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset('assets/bird.png'),
      width: birdSize,
      height: birdSize,
    );
  }
}
