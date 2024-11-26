import 'package:flutter/material.dart';

class BankMaster extends StatefulWidget {
  const BankMaster({super.key});

  @override
  State<BankMaster> createState() => _BankMasterPageState();
}

class _BankMasterPageState extends State<BankMaster> {
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _ifscController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // Simulated database of banks
  final List<Map<String, String>> _banks = [];

  void _addOrUpdateBank({int? index}) {
    if (_validateFields()) {
      // Check for unique IFSC code during add
      if (index == null &&
          _banks.any((bank) => bank["IFSC Code"] == _ifscController.text)) {
        _showMessage("IFSC Code already exists. Please use a unique IFSC.");
        return;
      }

      setState(() {
        if (index != null) {
          // Update existing bank
          _banks[index] = {
            "Bank Name": _bankNameController.text,
            "Branch Name": _branchNameController.text,
            "IFSC Code": _ifscController.text,
            "Address": _addressController.text,
          };
          _showMessage("Bank updated successfully.");
        } else {
          // Add new bank
          _banks.add({
            "Bank Name": _bankNameController.text,
            "Branch Name": _branchNameController.text,
            "IFSC Code": _ifscController.text,
            "Address": _addressController.text,
          });
          _showMessage("Bank added successfully.");
        }
        _clearFields();
      });
    }
  }

  void _deleteBank(int index) {
    setState(() {
      _banks.removeAt(index);
    });
    _showMessage("Bank deleted successfully.");
  }

  bool _validateFields() {
    if (_bankNameController.text.isEmpty ||
        _branchNameController.text.isEmpty ||
        _ifscController.text.isEmpty ||
        _addressController.text.isEmpty) {
      _showMessage("All fields are required.");
      return false;
    }
    return true;
  }

  void _clearFields() {
    _bankNameController.clear();
    _branchNameController.clear();
    _ifscController.clear();
    _addressController.clear();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showFormDialog({int? index}) {
    // Pre-fill form fields if editing
    if (index != null) {
      _bankNameController.text = _banks[index]["Bank Name"]!;
      _branchNameController.text = _banks[index]["Branch Name"]!;
      _ifscController.text = _banks[index]["IFSC Code"]!;
      _addressController.text = _banks[index]["Address"]!;
    } else {
      _clearFields();
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(index != null ? "Update Bank" : "Add Bank"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _bankNameController,
                  decoration: const InputDecoration(
                    labelText: "Bank Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _branchNameController,
                  decoration: const InputDecoration(
                    labelText: "Branch Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _ifscController,
                  decoration: const InputDecoration(
                    labelText: "IFSC Code",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                _addOrUpdateBank(index: index);
                Navigator.of(context).pop();
              },
              child: const Text("Save"),
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
        title: const Text("Bank Master Management"),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _showFormDialog(),
              child: const Text("Add Bank"),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _banks.isNotEmpty
                  ? ListView.builder(
                      itemCount: _banks.length,
                      itemBuilder: (context, index) {
                        final bank = _banks[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          elevation: 3,
                          child: ListTile(
                            title: Text(bank["Bank Name"]!),
                            subtitle: Text(
                                "Branch: ${bank["Branch Name"]}\nIFSC: ${bank["IFSC Code"]}\nAddress: ${bank["Address"]}"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit, color: Colors.blue),
                                  onPressed: () => _showFormDialog(index: index),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => _deleteBank(index),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        "No banks added yet.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
