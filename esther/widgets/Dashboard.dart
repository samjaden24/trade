import 'package:flutter/material.dart';
import 'package:stockapp/widgets/Billing.dart';
import 'package:stockapp/widgets/profile.dart';
import 'package:stockapp/widgets/tradeexec.dart';
import 'package:stockapp/widgets/tradehistory.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    // Show alert on first build
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        requestAlert(context);
      },
    );
  }

  // Alert dialog
  void requestAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Send Request", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Send", style: TextStyle(color: Colors.green, fontSize: 14)),
                ),
              ],
            ),
          ],
          content: Text("Do you want to send request?", style: TextStyle(fontSize: 14)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // List of screens that you want to navigate to
    List<Widget> screens = [
      _buildDashboardScreen(),
      Profile(),
      Tradeexec(),
      History(),
      Billing(),
    ];

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Dashboard'),
      //   centerTitle: false,
      //   elevation: 25.5,
      //   backgroundColor: Color.fromARGB(255, 157, 236, 241),
      // ),
      body: screens[index], // Display the current screen based on the index
    );
  }

  // Dashboard screen content
  Widget _buildDashboardScreen() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Status Section
            Card(
              elevation: 8,
              margin: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: const Color.fromARGB(255, 158, 187, 241),
              shadowColor: Colors.black26,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile Status",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey[800],
                      ),
                    ),
                    SizedBox(height: 12),
                    Text("Name: Angel", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    Text("Email: Angel@gmail.com", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                    SizedBox(height: 6),
                    Text("KYC Status: Verified", style: TextStyle(fontSize: 15, color: Colors.green)),
                    SizedBox(height: 18),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            index = 1; // Switch to Profile screen
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          backgroundColor: const Color.fromARGB(255, 142, 212, 233),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text("Manage Profile", style: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Quick Actions Section
            Card(
              elevation: 8,
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: const Color.fromARGB(255, 236, 159, 159),
              shadowColor: Colors.black26,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quick Actions",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey[800],
                      ),
                    ),
                    SizedBox(height: 12),
                    Text("To Buy or Sell the Stocks!!! "),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            index = 2; // Switch to Tradeexec screen
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
                          backgroundColor: const Color.fromARGB(255, 225, 171, 241),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text("Execute Trade", style: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Recent Trades Section
            Card(
              elevation: 8,
              margin: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: const Color.fromARGB(255, 143, 231, 177),
              shadowColor: Colors.black26,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recent Trades",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey[800],
                      ),
                    ),
                    SizedBox(height: 12),
                    // Example recent trade item
                    ListTile(
                      title: Text("AAPL Stock", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      subtitle: Text("Trade Type: Buy\nQuantity: 50\nDate: 11/22/2024", style: TextStyle(fontSize: 14)),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            index = 3; // Switch to History screen
                          });
                        },
                        style: TextButton.styleFrom(foregroundColor: Colors.blueAccent),
                        child: Text("View More", style: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Billing Notifications Section
            Card(
              elevation: 8,
              margin: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: const Color.fromARGB(255, 231, 178, 178),
              shadowColor: Colors.black26,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Billing Notifications",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey[800],
                      ),
                    ),
                    SizedBox(height: 12),
                    // Alert for new bills
                    Text("You have new bills ready for review or download.", style: TextStyle(fontSize: 15)),
                    SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            index = 4; // Switch to Billing screen
                          });
                        },
                        style: TextButton.styleFrom(foregroundColor: Colors.blueAccent),
                        child: Text("View Billing", style: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
