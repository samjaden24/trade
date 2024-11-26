import 'package:flutter/material.dart';
import 'package:trading/Logout.dart';
import 'package:trading/admin/Bankmaster.dart';
import 'package:trading/admin/Billinggeneration.dart';
import 'package:trading/admin/Configcharges.dart';
import 'package:trading/admin/Transaction.dart';
import 'package:trading/admin/Usermanagement.dart';
import 'package:trading/login.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});
  @override
  State<AdminDashboard> createState() => AdminDashboardState();
}

class AdminDashboardState extends State<AdminDashboard> {
  late int selectedIndex;
  List<Widget> pages = [
    TransactionManagement(),
    Center(child: Text('Dashboard', style: TextStyle(fontSize: 24))),
    Billinggeneration(),
    BankMaster(),
    UserManagement(),
    ConfigManagement(),
    Logout(),
  ];

  List<String> headings = [
    'Transaction',
    'Dashboard',
    'Billing Generation',
    'Bank Master',
    'User Management',
    'Config Charges',
    'Logout',
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = 0; // Default selected index
  }

  void setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
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
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Login()),
                // );
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
        title: Text(headings[selectedIndex]),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: const Text(
                "Navigation Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text("Transaction"),
              onTap: () {
                setSelectedIndex(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Dashboard"),
              onTap: () {
                setSelectedIndex(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.trending_up),
              title: const Text("Billing Generation"),
              onTap: () {
                setSelectedIndex(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text("Bank Master"),
              onTap: () {
                setSelectedIndex(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text("User Management"),
              onTap: () {
                setSelectedIndex(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                showLogoutDialog();
              },
            ),
          ],
        ),
      ),
      body: pages[selectedIndex],
    );
  }
}
