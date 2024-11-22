import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tradeflutter/screen/screen3.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
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
                      return 'Please enter your Nominee Name';
                    } else {
                      return null;
                    }
                  },
            
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Plea your Fse enterirst Name';
                  //   } else {
                  //     return null;
                  //   }
                  // },
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
                    } else {
                      return null;
                    }
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
                    } else {
                      return null;
                    }
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
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.email),
                      labelText: "Password",
                      hintText: "Enter Your Password"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please re-enter your Password';
                    } else {
                      return null;
                    }
                  },
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.email),
                      labelText: "Confirm Password",
                      hintText: "Re-enter Your Password"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: phoneNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Phone Number';
                    } else {
                      return null;
                    }
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
                    } else {
                      return null;
                    }
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
                    } else {
                      return null;
                    }
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
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(prefixIcon: Icon(Icons.person)),
                  hint: Text("Select the Bank"),
                  value: selectedBank,
                  onChanged: (String? newBank) {
                    setState(() {
                      selectedBank = newBank;
                    });
                  },
                  items: bank.map<DropdownMenuItem<String>>((String BankName) {
                    return DropdownMenuItem<String>(
                      value: BankName,
                      child: Text(BankName),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Phone Number';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(prefixIcon: Icon(Icons.person)),
                  hint: Text("Select the Branch"),
                  onChanged: (String? newBranch) {
                    setState(() {
                      selectedBranch = newBranch;
                    });
                  },
                  items: branch.map<DropdownMenuItem<String>>((String BranchName) {
                    return DropdownMenuItem<String>(
                        value: BranchName, child: Text(BranchName));
                  }).toList(),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your IFSC Code';
                    } else {
                      return null;
                    }
                  },
                  controller: IFSCcodeController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "IFSC Code",
                      hintText: "Enter Your IFSC Code"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Bank Account Number';
                    } else {
                      return null;
                    }
                  },
                  controller: bankAccountNumberController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "Bank Account Number",
                      hintText: "Enter Your Bank Account Number"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Address';
                    } else {
                      return null;
                    }
                  },
                  controller: addressController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
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
                            Navigator.push(context,MaterialPageRoute(builder: (context) => Screen3(),));
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
