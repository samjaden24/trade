import 'package:flutter/material.dart';
import 'package:flutterproject/screen/dashboardview.dart';
import 'package:flutterproject/screen/login.dart';
import 'package:flutterproject/screen/profile.dart';
import 'package:flutterproject/screen/tradeexecution.dart';
import 'package:flutterproject/screen/tradehistory.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    selectedIndex=0;
  }


  List <Widget> pages=[
    Profile(),
    DashboardView(),
    Tradeexecution(),
    Tradehistory(),
    Center(child: Text("This is Billing Page",style: TextStyle(fontSize: 24),)),
    
  ];

  late int selectedIndex;

  void setSelectedIndex(int index){
    setState(() {
      selectedIndex=index;
    });
  }

  void showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Do you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()), // Navigate to login page
                );
                 ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Logout successfully, Welcome back soon!'),
                    duration: const Duration(seconds: 3),
                  ),
                );
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
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
            leading: Icon(Icons.dashboard),
            title: Text("Dashboard"),
            onTap: () {
              setSelectedIndex(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.trending_up),
            title: Text("Trade Execution"),
            onTap: () {
              setSelectedIndex(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Trade History"),
            onTap: () {
              setSelectedIndex(3);
              Navigator.pop(context);
            },
          ),          ListTile(
            leading: Icon(Icons.receipt_long),
            title: Text("Billing"),
            onTap: () {
              setSelectedIndex(4);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              Navigator.pop(context);
              showLogoutDialog();
            },
          )
        ],
      )),
      body: pages[selectedIndex],
    );
  }
}