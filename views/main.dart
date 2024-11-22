import 'package:flutter/material.dart';
import 'package:tradeflutter/screen/dashboardview.dart';
import 'package:tradeflutter/screen/login.dart';
import 'package:tradeflutter/screen/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}