import 'package:flutter/material.dart';

class UserManageScreen extends StatefulWidget {
  const UserManageScreen({super.key});
  @override
  _UserManageScreenState createState() => _UserManageScreenState();
}

class _UserManageScreenState extends State<UserManageScreen> {
  final _formKey = GlobalKey<FormState>();

  String userId = '';
  String username = '';
  String? role;
  String? status;

  List<String> roles = ['Client', 'Back Office Admin', 'Billing Approver'];
  List<String> statuses = ['Active', 'Inactive'];

  void _showDialog(String action) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$action User'),
          content: Text('Are you sure you want to $action the user $username?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                _confirmAction(action);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _confirmAction(String action) {
    switch (action.toLowerCase()) {
      case 'create':
        _createUser();
        break;
      case 'update':
        _updateUser();
        break;
      case 'delete':
        _deleteUser();
        break;
    }
  }

  void _createUser() {
    print('User created: $username');
  }

  void _updateUser() {
    print('User updated: $username');
  }

  void _deleteUser() {
    print('User deleted: $username');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'User ID',
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    readOnly: true,
                    initialValue: userId,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      filled: true,
                      fillColor: Colors.pink[50],
                    ),
                    onChanged: (value) {
                      setState(() {
                        username = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Role',
                      filled: true,
                      fillColor: Colors.pink[50],
                    ),
                    value: role,
                    items: roles.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        role = newValue;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Status',
                      filled: true,
                      fillColor: Colors.pink[50],
                    ),
                    value: status,
                    items: statuses.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        status = newValue;
                      });
                    },
                  ),
                  SizedBox(height: 32),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 600) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _buildActionButtons(),
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: _buildActionButtons(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildActionButtons() {
    return [
      ElevatedButton(
        child: Text('Create User'),
        onPressed: () => _showDialog('Create'),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      ),
      SizedBox(height: 16, width: 16),
      ElevatedButton(
        child: Text('Update User'),
        onPressed: () => _showDialog('Update'),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      ),
      SizedBox(height: 16, width: 16),
      ElevatedButton(
        child: Text('Delete User'),
        onPressed: () => _showDialog('Delete'),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      ),
    ];
  }
}