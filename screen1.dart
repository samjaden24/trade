import 'package:flutter/material.dart';
import 'package:tradeflutter/screen/tradeexecution.dart';
import 'package:tradeflutter/screen/tradehistory.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState() {
    super.initState();
    selectedIndex=0;
  }


  List <Widget> pages=[
    Center(child: Text("This is Profile Page",style: TextStyle(fontSize: 24),)),
    Tradeexecution(),
    Tradehistory(),
    Center(child: Text("This is Logout",style: TextStyle(fontSize: 24),))
  ];

  late int selectedIndex;

  void setSelectedIndex(int index){
    setState(() {
      selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("FLATTRADE"),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue,),
              child: Text(
            "Navigation Menu",
            style: TextStyle(color: Colors.white, fontSize: 24),
          )),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              setSelectedIndex(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.trending_up),
            title: Text("Trade Execution"),
            onTap: () {
              setSelectedIndex(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Trade History"),
            onTap: () {
              setSelectedIndex(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              setSelectedIndex(3);
              Navigator.pop(context);
            },
          )
        ],
      )),
      body: pages[selectedIndex],
    );
  }
}