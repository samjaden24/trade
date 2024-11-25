import 'package:flutter/material.dart';
import 'package:flutterproject/admin/bankmaster.dart';
import 'package:flutterproject/admin/configCharge.dart';
import 'package:flutterproject/admin/purchase.dart';
import 'package:flutterproject/admin/request.dart';
import 'package:flutterproject/admin/transaction.dart';
import 'package:flutterproject/admin/usermanage.dart';
import 'package:flutterproject/screen/login.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  late int selectedIndex;

  // List of headers corresponding to the ListTile titles
  final List<String> headers = [
    "Dashboard",
    "Transaction",
    "Billing Generation",
    "Bank Master",
    "User Management",
    "Config Charges"
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()), // Navigate to login page
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
    Widget getBodyContent() {
      switch (selectedIndex) {
        case 0:
          return TabBarView(
            children: [
              ClientKycStatus(),
              ClientTradeApproval(),
            ],
          );
        case 1:
          return TransactionManagement();
        case 2:
          return Center(
            child: Text(
              "This is the Billing Generation Page",
              style: const TextStyle(fontSize: 24),
            ),
          );
        case 3:
          return const BankMasterManagement(); // Show Bank Master Management directly in the body
        case 4:
          return const UserManageScreen();
        case 5:
          return const ConfigManagement();
        default:
          return Center(
            child: Text(
              "This is the ${headers[selectedIndex]} Page",
              style: const TextStyle(fontSize: 24),
            ),
          );
      }
    }

    return DefaultTabController(
      length: 2, // Number of tabs (Request and Purchase)
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(headers[selectedIndex]), // Dynamic title
          bottom: selectedIndex == 0 // Show tabs only on the Dashboard
              ? const TabBar(
                  tabs: [
                    Tab(text: "Request"),
                    Tab(text: "Purchase"),
                  ],
                )
              : null,
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
                leading: const Icon(Icons.person),
                title: const Text("Dashboard"),
                onTap: () {
                  setSelectedIndex(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text("Transaction"),
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
                  setSelectedIndex(3); // Set index to Bank Master
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
                leading: const Icon(Icons.receipt_long),
                title: const Text("Config Charges"),
                onTap: () {
                  setSelectedIndex(5);
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
        body: getBodyContent(),
      ),
    );
  }
}
