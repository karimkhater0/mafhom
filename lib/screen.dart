import 'package:flutter/material.dart';

import 'curves2.dart';

class TestCurves extends StatelessWidget {
  TestCurves({super.key});
  var width = 400.0;
  late var height = width * 1.0638297872340425;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: CustomPaint(
            size: Size(width,
                height), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(),
          ),
        ),
      ),
    );
  }
}
