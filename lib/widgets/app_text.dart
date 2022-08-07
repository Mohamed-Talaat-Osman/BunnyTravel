import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  LargeText({Key? key,
    required this.text,
    required this.size,
    required this.color,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class RegularText extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  RegularText({Key? key,
    required this.text,
    required this.size,
    required this.color,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        // fontWeight: FontWeight.bold,
      ),
    );
  }
}

