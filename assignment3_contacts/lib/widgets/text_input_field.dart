import 'package:flutter/material.dart';
import 'package:contacts/constants.dart';

class TextInputField extends StatelessWidget {
  final onChanged, keyboardType, initialValue;
  TextInputField(
      {this.onChanged,
      this.keyboardType = TextInputType.text,
      this.initialValue = ''});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      style: mainTextStyle,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Please enter your phone number",
        enabled: true,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
      ),
    );
  }
}
