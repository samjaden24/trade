import 'package:flutter/material.dart';
import 'package:stockapp/screens/Home.dart';
import 'package:stockapp/screens/landingScreen.dart';
//import 'package:stockapp/screens/landingScreen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
const MyApp({super.key});
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home:Landing(),
    
    debugShowCheckedModeBanner: false,
    );
  }

}