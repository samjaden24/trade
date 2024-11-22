import 'package:flutter/material.dart';
import 'package:tradeflutter/screen/dashboardview.dart';
import 'package:tradeflutter/screen/tradeexecution.dart';
import 'package:tradeflutter/screen/tradehistory.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            // Profile Status Card
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.symmetric(vertical: 10),
              color: Colors.blue[50],
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 40,
                ),
                title: Text(
                  'Kamali',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email: kamali@gmail.com'),
                    Text('KYC Status: Pending'),
                  ],
                ),
                trailing: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      DashboardView();
                    });
                    // Navigator.pop(context);
                  },
                  child: Text('Manage Profile'),
                ),
              ),
            ),
            // Quick Actions Card
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.symmetric(vertical: 10),
              color: Colors.orange[50],
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Icon(
                  Icons.add_box,
                  color: Colors.orange,
                  size: 40,
                ),
                title: Text(
                  'Quick Actions',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Tradeexecution(),));
                    });
                    // Navigator.pop(context);
                  },
                  child: Text('Trade Execution'),
                ),
              ),
            ),
            // Recent Trades Card
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.symmetric(vertical: 10),
              color: Colors.green[50],
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Icon(
                  Icons.history,
                  color: Colors.green,
                  size: 40,
                ),
                title: Text(
                  'Recent Trades',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Stock: AAPL'),
                    Text('Trade Type: Buy'),
                    Text('Quantity: 100'),
                    Text('Date: 11/22/2024'),
                  ],
                ),
                trailing: TextButton(
                  onPressed: () {
                    setState(() {
                      Tradehistory();
                    });
                    // Navigator.pop(context);
                  },
                  child: Text(
                    'View More',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
            ),
            // Billing Notifications Card
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.symmetric(vertical: 10),
              color: Colors.purple[50],
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Icon(
                  Icons.receipt,
                  color: Colors.purple,
                  size: 40,
                ),
                title: Text(
                  'Billing Notifications',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('You have an outstanding balance of \$50.00.'),
                trailing: TextButton(
                  onPressed: () {
                    setState(() {});
                    // Navigator.pop(context);
                  },
                  child: Text(
                    'View Billing',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
