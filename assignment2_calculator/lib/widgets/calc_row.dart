import 'package:flutter/material.dart';
import 'calc_button.dart';

dynamic row(List<String> buttons,List onPressed, Color buttonColor) {
  return TableRow(children: [
    CalcButtons(
      text: buttons[0],
      color: buttonColor,
      onPressed: onPressed[0]
    ),
    CalcButtons(text: buttons[1], color: buttonColor,onPressed:onPressed[1]),
    CalcButtons(
      text: buttons[2],
      color: buttonColor,
      onPressed: onPressed[2]
    ),
  ]);
}
