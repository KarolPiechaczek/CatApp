import 'package:first_flutter_app/injection_container.dart';
import 'package:first_flutter_app/my_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 167, 220, 245)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Cat App'),
    );
  }
}

