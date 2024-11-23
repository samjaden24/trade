import 'package:flutter/material.dart';
import 'package:stockapp/repoistory/apicall.dart';
import 'package:stockapp/screens/Home.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _Register();
}

class _Register extends State<register> {
 final GlobalKey<FormState> _formKey1= GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController(text: "ttyyt");
  TextEditingController lastNameController = TextEditingController(text: "ttyyt");
  TextEditingController emailController = TextEditingController(text: "ttyyt");
  TextEditingController phoneController = TextEditingController(text: "ttyyt");
  TextEditingController panController = TextEditingController(text: "ttyyt");
  TextEditingController NomineeController = TextEditingController(text: "ttyyt");
  TextEditingController passwordController = TextEditingController(text: "ttyyt");
  TextEditingController password1Controller = TextEditingController(text: "ttyyt");
  TextEditingController accountnoController = TextEditingController(text: "ttyyt");
  TextEditingController ifscController = TextEditingController(text: "ttyyt");
  

  List<String> bankOptions =["SBI","HDFC","IDBI","IOB"];
  List<String> branchOptions =["Ambattur","Vadapalani","Avadi","Padi"];
  String bankValue = "SBI";
  String branchValue = "Ambattur";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.area_chart_sharp),
          title: Text("Register To Stock World"),
          centerTitle: true,
          elevation: 25.5,
          automaticallyImplyLeading: true,
          shadowColor: Color(7),
          backgroundColor: const Color.fromARGB(255, 71, 180, 243),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color.fromARGB(255, 248, 252, 253),
          child: ListView(children: [
            Padding(
                padding: const EdgeInsets.all(20.0),
                child:Form( 
                  key: _formKey1,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                            controller: firstNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              label: Text("First Name"),
                              filled:false,
                            
                              suffixIcon: Icon(Icons.person_3),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 93, 185, 212),
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 93, 185, 212),
                                      width: 2)),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                            controller: lastNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              label: Text("Last Name"),
                              filled:false,
                              fillColor:
                                  const Color.fromARGB(255, 214, 247, 247),
                              suffixIcon: Icon(Icons.person_3),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 93, 185, 212),
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 93, 185, 212),
                                      width: 2)),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                            controller: phoneController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              label: Text("Phone Number"),
                              filled:false,
                              fillColor:
                                  const Color.fromARGB(255, 214, 247, 247),
                              suffixIcon: Icon(Icons.phone_enabled_sharp),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 93, 185, 212),
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 93, 185, 212),
                                      width: 2)),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                            controller: panController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              label: Text("PAN Number"),
                              filled:false,
                              fillColor:
                                  const Color.fromARGB(255, 214, 247, 247),
                              suffixIcon: Icon(Icons.credit_card_outlined),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 93, 185, 212),
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 93, 185, 212),
                                      width: 2)),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                            controller: NomineeController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              label: Text("Nominee"),
                              filled:false,
                              fillColor:
                                  const Color.fromARGB(255, 214, 247, 247),
                              suffixIcon: Icon(Icons.person_add_alt_1_outlined),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 93, 185, 212),
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 93, 185, 212),
                                      width: 2)),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2),
                              ),
                            )),
                      ),
                      //Drop Down 
                     SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.8,
                       child: DropdownButtonFormField<String>(
                        dropdownColor: Color.fromARGB(255, 220, 237, 243),
                        decoration:InputDecoration(enabledBorder: OutlineInputBorder( borderSide: BorderSide(
                                      color:
                                          const Color.fromARGB(255, 93, 185, 212),
                                      width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 93, 185, 212),
                                        width: 2)),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 2),)) ,
                       
                         value: bankValue,
                         hint: Text('Select an option'),
                         onChanged: (value) {
                           setState(() {
                            // print(value);
                             bankValue= value!;
                           });
                         },
                                           
                        //  validator: (String value) {
                        //    if (value == null) {
                        //      return 'Please select an option';
                        //    }
                        //    return null;
                        //  },
                         items: bankOptions.map<DropdownMenuItem<String>>((String value) {
                           return DropdownMenuItem<String>(
                             value: value,
                             child: Text(value),
                           );
                         }).toList(),
                       ),
                     ),
                       SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.8,
                       child: DropdownButtonFormField<String>(
                        dropdownColor: Color.fromARGB(255, 220, 237, 243),
                        decoration:InputDecoration(enabledBorder: OutlineInputBorder( borderSide: BorderSide(
                                      color:
                                          const Color.fromARGB(255, 93, 185, 212),
                                      width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 93, 185, 212),
                                        width: 2)),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 2),)) ,
                       
                         value: branchValue,
                         hint: Text('Select an option'),
                         onChanged: (value) {
                           setState(() {
                            // print(value);
                             branchValue= value!;
                           });
                         },
                                           
                         // validator: (String value) {
                         //   if (value == null) {
                         //     return 'Please select an option';
                         //   }
                         //   return null;
                         // },
                         items: branchOptions.map<DropdownMenuItem<String>>((String value) {
                           return DropdownMenuItem<String>(
                             value: value,
                             child: Text(value),
                           );
                         }).toList(),
                       ),
                     ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                            controller: ifscController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              label: Text("IFSC Code"),
                              filled:false,
                              fillColor:
                                  const Color.fromARGB(255, 214, 247, 247),
                              suffixIcon: Icon(Icons.mail_rounded),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 93, 185, 212),
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 93, 185, 212),
                                      width: 2)),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                            controller: accountnoController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              label: Text("Account Number"),
                              filled:false,
                              fillColor:
                                  const Color.fromARGB(255, 214, 247, 247),
                              suffixIcon: Icon(Icons.account_balance_wallet),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 93, 185, 212),
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 93, 185, 212),
                                      width: 2)),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              label: Text("Email"),
                              filled:false,
                              fillColor:
                                  const Color.fromARGB(255, 214, 247, 247),
                              suffixIcon: Icon(Icons.mail_rounded),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 93, 185, 212),
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 93, 185, 212),
                                      width: 2)),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2),
                              ),
                            )),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter valid Password';
                                }
                                return null;
                              },
                              obscureText: true,
                              obscuringCharacter: "*",
                              controller: passwordController,
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.deepOrange),
                              decoration: InputDecoration(
                                label: Text("Password"),
                                
                               
                               filled:false,
                              fillColor:
                                  const Color.fromARGB(255, 214, 247, 247),
                              suffixIcon: Icon(Icons.remove_red_eye),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 93, 185, 212),
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 93, 185, 212),
                                      width: 2)),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2),
                              ),
                            )),
                        ),
                         SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter valid Password';
                                }
                                return null;
                              },
                              obscureText: true,
                              obscuringCharacter: "*",
                              controller: password1Controller,
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.deepOrange),
                              decoration: InputDecoration(
                                label: Text("Re-enter Password"),
                                
                               
                               filled:false,
                              fillColor:
                                  const Color.fromARGB(255, 214, 247, 247),
                              suffixIcon: Icon(Icons.remove_red_eye),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 93, 185, 212),
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 93, 185, 212),
                                      width: 2)),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2),
                              ),
                            )),
                        ),
                        
                      
                      ElevatedButton(
                        style: ButtonStyle(),
                        onPressed: ()async{
                           if (_formKey1.currentState?.validate()?? false){
                            try{
                            Map register = {
                              "first_name": firstNameController.text,
                              "last_name":lastNameController.text,
                              "pan_card":panController.text,
                              "email":emailController.text,
                              "password":passwordController.text,
                              "phone_number":phoneController.text,
                              "nominee_name":NomineeController.text
                            };
                            print(register);
                            Map response = await Apicall().postRegister(register);
                         if(response.isNotEmpty){
                           print("Response:::$response");
                           if(response["status"]=="S"){
                            print("Response:::$response");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Register Successfully")));
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
                           }
                         else{
                          //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:Colors.red,content: Text("Register Unsuccessful")));
                         }
                          }
                            }
                          catch(e){
                            print("Exeception::$e");
                          }
                            
                           }
                        }, child: Text("Register")),
                    ]))
         ) ]),
        ));
  }
}
