import 'package:flutter/material.dart';

class CalcButtons extends StatelessWidget {
  CalcButtons({this.text, this.color, this.onPressed});
  final String text;
  final color;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: FlatButton(
        onPressed:onPressed,
        child: Text(
          text,
          style: TextStyle(color: color, fontSize: 25),
        ),
      ),
    );
  }
}
