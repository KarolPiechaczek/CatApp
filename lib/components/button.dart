import 'package:flutter/material.dart';

TextButton generateButton(VoidCallback onClick, Color backgroundColor, String buttonText){
  return TextButton(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
    ),
    onPressed: () => onClick(),
    child: Text(buttonText),
  );
}