import 'package:flutter/material.dart';

class ReusableButtonChilds extends StatelessWidget {

  ReusableButtonChilds({required this.label, required this.iconValue});

  final String label;
  final iconValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30.0,),
          child:
          Text(
            label,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 15.0,
            ),
          ),
        ),
        Icon(iconValue,
          color: Colors.cyan,
          size: 50.0,
        ),
      ],
    );
  }
}