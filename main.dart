import 'package:flutter/material.dart';
import 'package:tradeflutter/screen/screen1.dart';
// import 'package:tradeflutter/screen/screen1.dart';
import 'package:tradeflutter/screen/screen2.dart';
import 'package:tradeflutter/screen/screen3.dart';
import 'package:tradeflutter/screen/screen4.dart';
import 'package:tradeflutter/screen/tradeexecution.dart';
import 'package:tradeflutter/screen/tradehistory.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tradeexecution(),
      debugShowCheckedModeBanner: false,
    );
  }
}

