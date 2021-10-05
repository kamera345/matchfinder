import 'package:flutter/material.dart';

class ReusableGuideStepsImages extends StatelessWidget {
  ReusableGuideStepsImages({required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        width: 300.0,
        height: 400.0,
        decoration: BoxDecoration(
          color: Colors.cyan,
          image: DecorationImage(
            image: AssetImage(
              'images/$name',
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
