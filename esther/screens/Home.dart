import 'package:flutter/material.dart';
import 'package:stockapp/screens/landingScreen.dart';
import 'package:stockapp/widgets/Dashboard.dart';
import 'package:stockapp/widgets/profile.dart';
import 'package:stockapp/widgets/tradeexec.dart';
import 'package:stockapp/widgets/tradehistory.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  List<Widget> screens = [
    Dashboard(),
    Profile(),
    Tradeexec(),
    History(),
  ];
  List<String>titles = ["DashBoard",
    "Profile","Trade Exceution",'Trade History'
  ];
  int index = 0;
 int titleIndex =0;

 // Alert Dialog
  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("LogOut"),
          content: const Text("Do you want to logout ?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Landing()));},
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
  @override
  void initState() {
    super.initState();
   
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[titleIndex],
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: false,
        elevation: 25.5,
        automaticallyImplyLeading: true,
        shadowColor: Color(7),
        backgroundColor:  Color.fromARGB(255, 157, 236, 241),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 157, 236, 241)),
              child: Container(
               
                child: Column(
                  children: [
                    // Enhanced CircleAvatar with border and profile image
                    CircleAvatar(
                      radius: 40.0, // Increased size for better visibility
                      backgroundImage: AssetImage('assets/images.png'), // You can replace this with a network image or local image
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "someone@gmail.com",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.ad_units_outlined),
              title: Text("DashBoard"),
              onTap: () {
                setState(() {
                  index = 0;
                  titleIndex=0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person_2_rounded),
              title: Text("Profile"),
              onTap: () {
                setState(() {
                  index = 1;
                   titleIndex=1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.money_sharp),
              title: Text("Trade Execution"),
              onTap: () {
                setState(() {
                  index = 2;
                   titleIndex=2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.manage_history_rounded),
              title: Text("Trade History"),
              onTap: () {
                setState(() {
                  index = 3;
                   titleIndex=3;

                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.add_chart_rounded),
              title: Text("Billing"),
              onTap: () {
                setState(() {});
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text("LogOut"),
              onTap: () {
                showAlert(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help_outline_sharp),
              title: Text("Help"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: screens[index],
      
    );
  }
}
