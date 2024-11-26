import 'package:flutter/material.dart';

class UserManagement extends StatefulWidget {
  const UserManagement({super.key});

  @override
  State<UserManagement> createState() => UserManagementpage();
}

class UserManagementpage extends State<UserManagement> {
  final _formKey = GlobalKey<FormState>();

  String username = '';
  String? role;
  String? status;

  List<String> roles = ['Client', 'Back Office Admin', 'Billing Approver'];
  List<String> statuses = ['Active', 'Inactive'];

  List<Map<String, String>> users = []; // Table to store user details

  void _addOrUpdateUser({int? index}) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        if (index != null) {
          // Update user at specific index
          users[index] = {
            'userId': users[index]['userId'] ?? '${index + 1}',
            'username': username,
            'role': role ?? '',
            'status': status ?? '',
          };
        } else {
          // Add new user
          users.add({
            'userId': '${users.length + 1}', // Auto-generate ID
            'username': username,
            'role': role ?? '',
            'status': status ?? '',
          });
        }
      });
    }
  }

  void _deleteUser(int index) {
    setState(() {
      users.removeAt(index);
    });
  }

  void _showFormDialog({int? index}) {
    // If editing, populate fields
    if (index != null) {
      username = users[index]['username'] ?? '';
      role = users[index]['role'];
      status = users[index]['status'];
    } else {
      username = '';
      role = null;
      status = null;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(index != null ? 'Update User' : 'Add User'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    filled: true,
                    fillColor: Colors.pink[50],
                  ),
                  initialValue: username,
                  onChanged: (value) {
                    username = value;
                  },
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Username is required' : null,
                ),
                const SizedBox(height: 16),
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
                    role = newValue;
                  },
                  validator: (value) =>
                      value == null ? 'Please select a role' : null,
                ),
                const SizedBox(height: 16),
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
                    status = newValue;
                  },
                  validator: (value) =>
                      value == null ? 'Please select a status' : null,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                _addOrUpdateUser(index: index);
                Navigator.of(context).pop();
              },
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
        title: const Text('User Management'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () => _showFormDialog(),
                child: const Text('Add User'),
              ),
            ),
            Expanded(
              child: users.isEmpty
                  ? const Center(
                      child: Text('No users available'),
                    )
                  : SingleChildScrollView(
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('User ID')),
                          DataColumn(label: Text('Username')),
                          DataColumn(label: Text('Role')),
                          DataColumn(label: Text('Status')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: users
                            .asMap()
                            .entries
                            .map(
                              (entry) => DataRow(
                                cells: [
                                  DataCell(Text(entry.value['userId'] ?? '')),
                                  DataCell(Text(entry.value['username'] ?? '')),
                                  DataCell(Text(entry.value['role'] ?? '')),
                                  DataCell(Text(entry.value['status'] ?? '')),
                                  DataCell(
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.edit,
                                              color: Colors.blue),
                                          onPressed: () =>
                                              _showFormDialog(index: entry.key),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete,
                                              color: Colors.red),
                                          onPressed: () =>
                                              _deleteUser(entry.key),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
