import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularStat extends StatelessWidget {
  final double percentage;
  CircularStat({this.percentage});
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 120.0,
      animation: true,
      animationDuration: 1200,
      lineWidth: 20.0,
      percent: 0.4,
      circularStrokeCap: CircularStrokeCap.square,
      backgroundColor: Colors.yellow,
      progressColor: Colors.red,
    );
  }
}
