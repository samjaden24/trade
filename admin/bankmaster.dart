import 'package:flutter/material.dart';

class BankMasterManagement extends StatefulWidget {
  const BankMasterManagement({super.key});

  @override
  State<BankMasterManagement> createState() => _BankMasterManagementState();
}

class _BankMasterManagementState extends State<BankMasterManagement> {
  // Controllers for text fields
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _ifscController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _ifscSearchController = TextEditingController();

  // Simulated database of banks
  final List<Map<String, String>> _banks = [];

  void _addBank() {
    if (_validateFields()) {
      // Check for unique IFSC code
      if (_banks.any((bank) => bank["IFSC Code"] == _ifscController.text)) {
        _showMessage("IFSC Code already exists. Please use a unique IFSC.");
        return;
      }

      setState(() {
        _banks.add({
          "Bank Name": _bankNameController.text,
          "Branch Name": _branchNameController.text,
          "IFSC Code": _ifscController.text,
          "Address": _addressController.text,
        });
        _clearFields();
      });
      _showMessage("Bank added successfully.");
    }
  }

  void _updateBank() {
    if (_validateFields() && _ifscSearchController.text.isNotEmpty) {
      final index = _banks.indexWhere((bank) => bank["IFSC Code"] == _ifscSearchController.text);

      if (index != -1) {
        setState(() {
          _banks[index] = {
            "Bank Name": _bankNameController.text,
            "Branch Name": _branchNameController.text,
            "IFSC Code": _ifscController.text,
            "Address": _addressController.text,
          };
          _clearFields();
        });
        _showMessage("Bank updated successfully.");
      } else {
        _showMessage("No bank found with the given IFSC Code.");
      }
    } else {
      _showMessage("Please provide valid details and the IFSC Code to update.");
    }
  }

  void _deleteBank() {
    if (_ifscSearchController.text.isNotEmpty) {
      final index = _banks.indexWhere((bank) => bank["IFSC Code"] == _ifscSearchController.text);

      if (index != -1) {
        setState(() {
          _banks.removeAt(index);
        });
        _clearFields();
        _showMessage("Bank deleted successfully.");
      } else {
        _showMessage("No bank found with the given IFSC Code.");
      }
    } else {
      _showMessage("Please provide the IFSC Code to delete.");
    }
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
    _ifscSearchController.clear();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Bank Name Input
              TextField(
                controller: _bankNameController,
                decoration: InputDecoration(
                  labelText: "Bank Name",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.blue[50],
                ),
              ),
              const SizedBox(height: 16),

              // Branch Name Input
              TextField(
                controller: _branchNameController,
                decoration: InputDecoration(
                  labelText: "Branch Name",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.blue[50],
                ),
              ),
              const SizedBox(height: 16),

              // IFSC Code Input
              TextField(
                controller: _ifscController,
                decoration: InputDecoration(
                  labelText: "IFSC Code",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.blue[50],
                ),
              ),
              const SizedBox(height: 16),

              // Address Input
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: "Address",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.blue[50],
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),

              // IFSC Search Input
              TextField(
                controller: _ifscSearchController,
                decoration: InputDecoration(
                  labelText: "Search by IFSC Code",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.blue[50],
                ),
              ),
              const SizedBox(height: 16),

              // Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _addBank,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text("Add Bank"),
                  ),
                  ElevatedButton(
                    onPressed: _updateBank,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text("Update Bank"),
                  ),
                  ElevatedButton(
                    onPressed: _deleteBank,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text("Delete Bank"),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Bank List Display
              if (_banks.isNotEmpty)
                ..._banks.map((bank) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 3,
                    child: ListTile(
                      title: Text(bank["Bank Name"]!),
                      subtitle: Text(
                          "Branch: ${bank["Branch Name"]}\nIFSC: ${bank["IFSC Code"]}\nAddress: ${bank["Address"]}"),
                    ),
                  );
                }).toList()
              else
                const Text(
                  "No banks added yet.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
