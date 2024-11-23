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
  int _selectedPageIndex = -1; // Tracks the selected page (-1 means the main profile page)

  // List of pages to navigate
  final List<Widget> pages = [
    DashboardView(),
    Tradeexecution(),
    Tradehistory(),
  ];

  // Headers corresponding to each page
  final List<String> headers = [
    'Manage Profile',
    'Trade Execution',
    'Recent Trades',
  ];

  // Method to navigate to a specific page and update the app bar title
  void _navigateToPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: Text(
          _selectedPageIndex == -1
              ? 'Profile'
              : headers[_selectedPageIndex], // Update title based on selected page
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: _selectedPageIndex != -1
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  // Return to the main profile page
                  setState(() {
                    _selectedPageIndex = -1;
                  });
                },
              )
            : null,
      ),
      body: _selectedPageIndex == -1
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue[50]!,
                    Colors.blue[100]!,
                    Colors.blue[200]!,
                  ],
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Profile Status Card
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: Icon(
                        Icons.person,
                        color: Colors.blue[900],
                        size: 40,
                      ),
                      title: Text(
                        'Sam Solomon Smiles',
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email: sam@gmail.com',
                            style: TextStyle(color: Colors.blue[700]),
                          ),
                          Text(
                            'KYC Status: Pending',
                            style: TextStyle(color: Colors.blue[700]),
                          ),
                        ],
                      ),
                      trailing: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () => _navigateToPage(0), // Navigate to "Manage Profile"
                        child: const Text('Manage Profile'),
                      ),
                    ),
                  ),
                  // Quick Actions Card
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: Icon(
                        Icons.add_box,
                        color: Colors.blue[900],
                        size: 40,
                      ),
                      title: Text(
                        'Quick Actions',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                      ),
                      trailing: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () => _navigateToPage(1), // Navigate to "Trade Execution"
                        child: const Text('Trade Execution'),
                      ),
                    ),
                  ),
                  // Recent Trades Card
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: Icon(
                        Icons.history,
                        color: Colors.blue[900],
                        size: 40,
                      ),
                      title: Text(
                        'Recent Trades',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Stock: AAPL',
                            style: TextStyle(color: Colors.blue[700]),
                          ),
                          Text(
                            'Trade Type: Buy',
                            style: TextStyle(color: Colors.blue[700]),
                          ),
                          Text(
                            'Quantity: 100',
                            style: TextStyle(color: Colors.blue[700]),
                          ),
                          Text(
                            'Date: 11/22/2024',
                            style: TextStyle(color: Colors.blue[700]),
                          ),
                        ],
                      ),
                      trailing: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () => _navigateToPage(2), // Navigate to "Recent Trades"
                        child: const Text('View More'),
                      ),
                    ),
                  ),
                   Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.white,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: Icon(
                  Icons.receipt,
                  color: Colors.blue[900],
                  size: 40,
                ),
                title: Text(
                  'Billing Notifications',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
                subtitle: Text(
                  'You have an outstanding balance of \$50.00.',
                  style: TextStyle(color: Colors.blue[700]),
                ),
                trailing: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('View Billing'),
                ),
              ),
            ),
                ],
              ),
            )
          : pages[_selectedPageIndex], // Show the selected page,
    );
  }
}