import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterproject/screen/login.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController panCardController = TextEditingController();
  final TextEditingController nomineeNameController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController BranchNameController = TextEditingController();
  final TextEditingController IFSCcodeController = TextEditingController();
  final TextEditingController bankAccountNumberController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String? selectedBank;
  String? selectedBranch;
  bool passVisibility=true;
  bool repassVisibility=true;

  List<String> bank = ['HDFC', 'KVB', 'SBI', 'IOB'];
  List<String> branch = [
    'Vadapalani',
    'Ambattur',
    'Thirumangalam',
    'Velachery'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Registration",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                TextFormField(
                  controller: firstNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your First Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "First Name",
                      hintText: "Enter Your First Name"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: lastNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Last Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "Last Name",
                      hintText: "Enter Your Last Name"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your EmailId';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: "Email",
                      hintText: "Enter Your EmailID"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton( onPressed: () {
                        setState(() {
                          passVisibility=!passVisibility;
                        });
                      },icon: Icon(passVisibility?Icons.remove_red_eye:Icons.remove_red_eye_outlined),),
                      labelText: "Password",
                      hintText: "Enter Your Password"),
                  obscureText: passVisibility,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please re-enter your Password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton(onPressed: () {
                        setState(() {
                          repassVisibility=!repassVisibility;
                        });
                      }, icon: Icon(repassVisibility? Icons.remove_red_eye:Icons.remove_red_eye_outlined)),
                      labelText: "Confirm Password",
                      hintText: "Re-enter Your Password"),
                  obscureText: repassVisibility,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: phoneNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Phone Number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      labelText: "Phone Number",
                      hintText: "Enter Your Phone Number"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: panCardController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your PAN Card Number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.credit_card),
                      labelText: "PAN Card",
                      hintText: "Enter Your PAN Card Number"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: nomineeNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Nominee Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "Nominee Name",
                      hintText: "Enter Your Nominee Name"),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a Bank';
                    }
                    return null;
                  },
                  decoration: InputDecoration(prefixIcon: Icon(Icons.account_balance_sharp)),
                  hint: Text("Select the Bank"),
                  value: selectedBank,
                  onChanged: (String? newBank) {
                    setState(() {
                      selectedBank = newBank;
                    });
                  },
                  items: bank.map<DropdownMenuItem<String>>((String bankName) {
                    return DropdownMenuItem<String>(
                      value: bankName,
                      child: Text(bankName),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a Branch';
                    }
                    return null;
                  },
                  decoration: InputDecoration(prefixIcon: Icon(Icons.business)),
                  hint: Text("Select the Branch"),
                  onChanged: (String? newBranch) {
                    setState(() {
                      selectedBranch = newBranch;
                    });
                  },
                  items: branch.map<DropdownMenuItem<String>>((String branchName) {
                    return DropdownMenuItem<String>(
                        value: branchName, child: Text(branchName));
                  }).toList(),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: IFSCcodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your IFSC Code';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.code),
                      labelText: "IFSC Code",
                      hintText: "Enter Your IFSC Code"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: bankAccountNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Bank Account Number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_balance_wallet),
                      labelText: "Bank Account Number",
                      hintText: "Enter Your Bank Account Number"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: addressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      labelText: "Address",
                      hintText: "Enter Your Address"),
                  keyboardType: TextInputType.multiline,
                  minLines: 2,
                  maxLines: 4,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print("Validated");

                      // Show success SnackBar
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Successfully Registered!'),
                        backgroundColor: Colors.green,
                      ));

                      // Navigate to next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    }
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
