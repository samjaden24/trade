// import 'package:flutter/material.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();


//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Profile'),
//       //   backgroundColor: Colors.blueAccent,
//       // ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Profile Card
//             Card(
//               elevation: 10,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 children: [
//                   // Profile Picture
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: CircleAvatar(
//                       radius: 50,
//                       // backgroundImage: NetworkImage(''), // Replace with user's image URL
//                       backgroundColor: Colors.grey.shade200,
//                     ),
//                   ),
//                   // User Name
//                   Text(
//                     'John Doe', // Replace with user's name
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   // User Email
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: Text(
//                       'johndoe@example.com', // Replace with user's email
//                       style: TextStyle(fontSize: 16, color: Colors.grey),
//                     ),
//                   ),
//                   // User Phone
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: Text(
//                       '+1 234 567 890', // Replace with user's phone number
//                       style: TextStyle(fontSize: 16, color: Colors.grey),
//                     ),
//                   ),
//                   // User Bio
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       'A short bio or description about the user can go here.',
//                       style: TextStyle(fontSize: 14, color: Colors.grey),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<Profile> {
  bool isEditing = false;
  TextEditingController _nomineeNameController = TextEditingController();
  TextEditingController _bankAccountController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  String? _selectedBank;
  String? _selectedBranch;

  final List<String> _banks = ['Bank A', 'Bank B', 'Bank C'];
  final List<String> _branches = ['Branch 1', 'Branch 2', 'Branch 3'];

  // Sample profile data
  final String firstName = 'Esther';
  final String lastName = 'Jasmine';
  final String email = 'esther@gmail.com';
  final String phone = '+1234567890';
  final String panCard = 'ABCDE1234F';
  final String kycStatus = 'Verified';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Profile'),
      //   backgroundColor: Colors.blueAccent,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Overview (Read-Only)
            _buildSectionTitle('Profile Overview'),
            _buildProfileInfo('First Name', firstName),
            _buildProfileInfo('Last Name', lastName),
            _buildProfileInfo('Email', email),
            _buildProfileInfo('Phone Number', phone),
            _buildProfileInfo('PAN Card Number', panCard),
            _buildProfileInfo('KYC Status', kycStatus),
            SizedBox(height: 20),

            // Nominee Information (Editable)
            _buildSectionTitle('Nominee Information'),
            _buildEditableField('Nominee Name', _nomineeNameController),

            SizedBox(height: 20),

            // Bank Details (Editable)
            _buildSectionTitle('Bank Details'),
            _buildDropdownField('Bank Name', _banks, _selectedBank, (value) {
              setState(() {
                _selectedBank = value;
              });
            }),
            _buildDropdownField('Branch Name', _branches, _selectedBranch, (value) {
              setState(() {
                _selectedBranch = value;
              });
            }),
            _buildProfileInfo('IFSC Code', 'IFSC000123'),
            _buildEditableField('Bank Account Number', _bankAccountController),

            SizedBox(height: 20),

            // Address (Editable)
            _buildSectionTitle('Address'),
            _buildEditableField('Address', _addressController),

            SizedBox(height: 30),

            // Action Buttons
            _buildActionButton(),
          ],
        ),
      ),
    );
  }

  // Helper methods
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.blueAccent,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildProfileInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey[700],
              fontSize: 16,
            ),
          ),
          SizedBox(width: 10),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        enabled: isEditing,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.blueAccent),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blueAccent, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, List<String> items, String? selectedValue, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: isEditing ? onChanged : null,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.blueAccent),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blueAccent, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              isEditing = !isEditing;
            });
          },
          child: Text(isEditing ? 'Save' : 'Edit'),
          style: ElevatedButton.styleFrom(
            backgroundColor: isEditing ? Colors.green : Colors.orange,
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 5,
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        if (isEditing) ...[
          // ElevatedButton(
          //   onPressed: () {
          //     // Handle saving data
          //     setState(() {
          //       isEditing = false;
          //     });
          //   },
          //   child: Text('Save'),
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.blueAccent,
          //     padding: EdgeInsets.symmetric(vertical: 14, horizontal: 32),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //     elevation: 5,
          //   ),
          // ),
        ],
      ],
    );
  }
}
