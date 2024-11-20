import 'package:flutter/material.dart';
// import 'package:tradeapp/screen/screen2.dart';
// import 'package:tradeapp/screen/screen3.dart';
import 'package:tradeapp/screen/screen4.dart';
// import 'package:tradeapp/screen/screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen4(),
      debugShowCheckedModeBanner: false,
    );
  }
}

