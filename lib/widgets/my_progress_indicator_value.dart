import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyProgressIndicatorValue extends StatelessWidget {
  const MyProgressIndicatorValue(
      {super.key,
      this.name,
      this.amount,
      required this.percentStage,
      required this.color,
      required this.data});

  final String? name, amount;
  final String percentStage;
  final Color color;
  final double data;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 22,
      circularStrokeCap: CircularStrokeCap.round,
      percent: data,
      lineWidth: 7,
      reverse: true,
      backgroundColor: color.withOpacity(0.2),
      animation: true,
      animationDuration: 500,
      restartAnimation: true,
      progressColor: color,
      header: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(
          name!,
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize: 12,
          ),
        ),
      ),
      footer: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "$amount",
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: percentStage,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
