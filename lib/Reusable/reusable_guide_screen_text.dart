import 'package:flutter/material.dart';

class ReusableGuideStepsText extends StatelessWidget {
  ReusableGuideStepsText({required this.steps});
  final String steps;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Text(
        steps,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}