import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => DashboardViewState();
}

class DashboardViewState extends State<DashboardView> {
  // Define the editable fields and their values
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController panCardController = TextEditingController();
  TextEditingController kycStatusController = TextEditingController();
  TextEditingController nomineeController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool isEditable = false; // Flag to toggle edit mode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('DashboardView')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // First Card: Personal Info
            Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16.0), // Space between cards
              child: Padding(
                padding: const EdgeInsets.all(20.0), // Padding inside the card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Personal Information',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    const SizedBox(height: 10),
                    _buildTextField(
                      controller: firstNameController,
                      label: 'First Name',
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 16), // Space between fields
                    _buildTextField(
                      controller: lastNameController,
                      label: 'Last Name',
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: emailController,
                      label: 'Email',
                      icon: Icons.email,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: phoneController,
                      label: 'Phone Number',
                      icon: Icons.phone,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: panCardController,
                      label: 'Pan Card Number',
                      icon: Icons.credit_card,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: kycStatusController,
                      label: 'KYC Status',
                      icon: Icons.check_circle,
                    ),
                  ],
                ),
              ),
            ),

            // Second Card: Nominee Name
            Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16.0), // Space between cards
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nominee Information',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    const SizedBox(height: 10),
                    _buildTextField(
                      controller: nomineeController,
                      label: 'Nominee Name',
                      icon: Icons.person_add,
                    ),
                  ],
                ),
              ),
            ),

            // Third Card: Bank Details
            Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16.0), // Space between cards
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bank Details',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                     SizedBox(height: 10),
                    _buildDropdown(
                      label: 'Bank Name',
                      icon: Icons.home,
                      items: ['Bank 1', 'Bank 2', 'Bank 3'],
                    ),
                     SizedBox(height: 16), // Space between fields
                    _buildDropdown(
                      label: 'Branch Name',
                      icon: Icons.location_on,
                      items: ['Branch 1', 'Branch 2', 'Branch 3'],
                    ),
                     SizedBox(height: 16),
                    _buildTextField(
                      controller: ifscController,
                      label: 'IFSC Code',
                      icon: Icons.code,
                    ),
                     SizedBox(height: 16),
                    _buildTextField(
                      controller: accountNumberController,
                      label: 'Bank Account Number',
                      icon: Icons.account_balance,
                    ),
                  ],
                ),
              ),
            ),

            // Fourth Card: Address
            Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16.0), // Space between cards
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Address Information',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    const SizedBox(height: 10),
                    _buildTextField(
                      controller: addressController,
                      label: 'Address',
                      icon: Icons.home,
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
            ),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEditable = !isEditable;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isEditable ? Colors.green : Colors.orange,
                  ),
                  child: Text(isEditable ? 'Save' : 'Edit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Method for creating text fields with icons
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      readOnly: !isEditable,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: isEditable ? Colors.blue : Colors.grey),
        labelText: label,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: isEditable ? Colors.blue : Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: isEditable ? Colors.blue : Colors.grey),
        ),
      ),
    );
  }

  // Method for creating dropdown fields
  Widget _buildDropdown({
    required String label,
    required IconData icon,
    required List<String> items,
  }) {
    return DropdownButtonFormField<String>(
      value: items.isNotEmpty ? items[0] : null,
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: isEditable
          ? (value) {
              // Handle change
            }
          : null,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: isEditable ? Colors.blue : Colors.grey),
        labelText: label,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: isEditable ? Colors.blue : Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: isEditable ? Colors.blue : Colors.grey),
        ),
      ),
    );
  }
}

