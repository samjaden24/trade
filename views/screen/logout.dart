import 'package:flutter/material.dart';
import 'package:tradeflutter/screen/login.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListTile(
  leading: Icon(Icons.logout),
  title: Text("Logout"),
  onTap: () {
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
                // Perform logout logic here (e.g., navigate to login screen)
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),)); // Close the dialog
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  },
),
    );
  }
}