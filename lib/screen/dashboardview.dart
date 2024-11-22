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
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: const Text(
      //     'Manage Profile',
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      //   backgroundColor: Colors.blue[900],
      // ),
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // First Card: Personal Info
              _buildCard(
                title: 'Personal Information',
                children: [
                  _buildTextField(
                    controller: firstNameController,
                    label: 'First Name',
                    icon: Icons.person,
                  ),
                  _buildTextField(
                    controller: lastNameController,
                    label: 'Last Name',
                    icon: Icons.person,
                  ),
                  _buildTextField(
                    controller: emailController,
                    label: 'Email',
                    icon: Icons.email,
                  ),
                  _buildTextField(
                    controller: phoneController,
                    label: 'Phone Number',
                    icon: Icons.phone,
                  ),
                  _buildTextField(
                    controller: panCardController,
                    label: 'Pan Card Number',
                    icon: Icons.credit_card,
                  ),
                  _buildTextField(
                    controller: kycStatusController,
                    label: 'KYC Status',
                    icon: Icons.check_circle,
                  ),
                ],
              ),

              // Second Card: Nominee Info
              _buildCard(
                title: 'Nominee Information',
                children: [
                  _buildTextField(
                    controller: nomineeController,
                    label: 'Nominee Name',
                    icon: Icons.person_add,
                  ),
                ],
              ),

              // Third Card: Bank Details
              _buildCard(
                title: 'Bank Details',
                children: [
                  _buildDropdown(
                    label: 'Bank Name',
                    icon: Icons.home,
                    items: ['Bank 1', 'Bank 2', 'Bank 3'],
                  ),
                  _buildDropdown(
                    label: 'Branch Name',
                    icon: Icons.location_on,
                    items: ['Branch 1', 'Branch 2', 'Branch 3'],
                  ),
                  _buildTextField(
                    controller: ifscController,
                    label: 'IFSC Code',
                    icon: Icons.code,
                  ),
                  _buildTextField(
                    controller: accountNumberController,
                    label: 'Bank Account Number',
                    icon: Icons.account_balance,
                  ),
                ],
              ),

              // Fourth Card: Address
              _buildCard(
                title: 'Address Information',
                children: [
                  _buildTextField(
                    controller: addressController,
                    label: 'Address',
                    icon: Icons.home,
                    maxLines: 5,
                  ),
                ],
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
                      backgroundColor: isEditable
                          ? Colors.green[700] // Green shade for Save button
                          : Colors.blue[700], // Blue shade for Edit button
                      foregroundColor: Colors.white, // White text color
                      shadowColor: isEditable
                          ? Colors.green[400]
                          : Colors.blue[400], // Lighter shadow
                      elevation: 5, // Slight elevation for button depth
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Rounded corners
                      ),
                    ),
                    child: Text(
                      isEditable ? 'Save' : 'Edit',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Card Builder
  Widget _buildCard({required String title, required List<Widget> children}) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            ...children,
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        readOnly: !isEditable,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: isEditable ? Colors.blue : Colors.grey),
          labelText: label,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: isEditable ? Colors.blue : Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: isEditable ? Colors.blue : Colors.grey),
          ),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
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
            borderSide:
                BorderSide(color: isEditable ? Colors.blue : Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: isEditable ? Colors.blue : Colors.grey),
          ),
        ),
      ),
    );
  }
}
