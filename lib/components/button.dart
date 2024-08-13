import 'package:flutter/material.dart';

class Button {
  var foregroundColor = WidgetStateProperty.all<Color>(Colors.white);
  var backgroundColor = WidgetStateProperty.all<Color>(const Color.fromARGB(255, 102, 198, 242)); 
  Function function;
  String text;
  Button({required this.function, required this.text});
}


