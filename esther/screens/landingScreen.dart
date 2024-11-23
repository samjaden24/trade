// import 'package:flutter/material.dart';
// import 'package:stockapp/screens/RegisterScreen.dart';
// import 'package:stockapp/screens/Home.dart';

// class Landing extends StatefulWidget {
//   const Landing({super.key});

//   @override
//   State<Landing> createState() => _Login();
// }

// class _Login extends State<Landing> {
//   final GlobalKey<FormState>  _formKey = GlobalKey<FormState>();
//   TextEditingController email = TextEditingController();
//   TextEditingController pass = TextEditingController();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         // appBar: AppBar(actions: [],),
//         body: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         color: const Color.fromARGB(255, 182, 226, 240),
//         height: double.infinity,
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Container(color: Color.fromARGB(26, 9, 158, 54),
//             // height: MediaQuery.of(context).size.height*0.99,
//             // width:MediaQuery.of(context).size.width,
//             // )
//             Card(
//                 elevation: 20,
//                 //shadowColor: Colors.amber.shade50,
//                 color:const Color.fromARGB(255, 182, 226, 240),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(15))),
                
//                 child: Padding(
//                    padding: EdgeInsets.all(15),
//                     child: Form(
//                       key: _formKey,
//                         child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         RichText(
//                             text: const TextSpan(
//                                 style:
//                                     TextStyle(color: Colors.lime, fontSize: 40),
//                                 children: [
//                               TextSpan(text: "Trade"),
//                               TextSpan(text: "ProMax")
//                             ])),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.1,
//                           width: MediaQuery.of(context).size.width * 0.8,
//                           child: TextFormField(
                             
//                               controller: email,
                            
                             
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter valid email';
//                                 }
                               
//                                 return null;
//                               },
//                               cursorColor: Colors.black,
//                               style: TextStyle(color: Colors.deepOrange),
//                               decoration: InputDecoration(
//                                 label: Text("Email"),
//                                 // hintText: "Enter your Valid Mail",
//                                 // hintStyle: TextStyle(color: Colors.blue),
//                                 filled: true,
//                                 fillColor:
//                                     const Color.fromARGB(255, 232, 236, 184),
//                                 suffixIcon: Icon(Icons.mail_rounded),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Colors.green, width: 2),
//                                   borderRadius: BorderRadius.vertical(
//                                       top: Radius.circular(30),
//                                       bottom: Radius.circular(30)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Colors.green, width: 2),
//                                   borderRadius: BorderRadius.vertical(
//                                       top: Radius.circular(30),
//                                       bottom: Radius.circular(30)),
//                                 ),
//                                 errorBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Colors.red, width: 2),
//                                   borderRadius: BorderRadius.vertical(
//                                       top: Radius.circular(30),
//                                       bottom: Radius.circular(30)),),
//                               )),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.1,
//                           width: MediaQuery.of(context).size.width * 0.8,
//                           child: TextFormField(
//                             validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter valid Password';
//                                 }
//                                 return null;
//                               },
//                               obscureText: true,
//                               obscuringCharacter: "*",
//                               controller: pass,
//                               cursorColor: Colors.black,
//                               style: TextStyle(color: Colors.deepOrange),
//                               decoration: InputDecoration(
//                                 label: Text("Password"),
                                
//                                 filled: true,
//                                 fillColor:
//                                     const Color.fromARGB(255, 232, 236, 184),
//                                 suffixIcon: Icon(Icons.remove_red_eye_sharp),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Colors.green, width: 2),
//                                   borderRadius: BorderRadius.vertical(
//                                       top: Radius.circular(30),
//                                       bottom: Radius.circular(30)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Colors.green, width: 2),
//                                   borderRadius: BorderRadius.vertical(
//                                       top: Radius.circular(30),
//                                       bottom: Radius.circular(30)),
//                                 ),                                errorBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Colors.red, width: 2),
//                                   borderRadius: BorderRadius.vertical(
//                                       top: Radius.circular(30),
//                                       bottom: Radius.circular(30)),),
//                               )),
//                         ),
//                         ElevatedButton(
                          
//                             onPressed: () {
//                               if (_formKey.currentState?.validate()?? false){
//                                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
                                
//                               }
//                               else{
                                
//                               }
//                             },
                          
//                             child: Text("Login")),
//                         TextButton(
//                             onPressed: () {
//                               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>register()));
//                             },
//                             autofocus: true,
//                             style: ButtonStyle(),
//                             child: Text("Register here ?"))
//                       ],
//                     ))))
//           ],
//         ),
//       ),
//     ));
//   }
// }



import 'package:flutter/material.dart';
import 'package:stockapp/screens/RegisterScreen.dart';
import 'package:stockapp/screens/Home.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _Login();
}

class _Login extends State<Landing> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers for username and password fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to validate and submit the form
  void _login() {
    if (_formKey.currentState!.validate()) {
      // Perform login logic here
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: const Color.fromARGB(255, 241, 170, 194), content: Text('Logging in...')));
    }
  }

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background gradient
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, const Color.fromARGB(255, 211, 224, 153)!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Logo or title
                      Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      // Username Field
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.blueAccent),
                          hintText: 'Enter your username',
                          hintStyle: TextStyle(color: Colors.blue[100]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      // Password Field
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.blueAccent),
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: Colors.blue[100]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),

                      // Login Button
                      ElevatedButton(
                        onPressed: (){
                          if (_formKey.currentState?.validate()?? false){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 5,
                        ),
                      ),
                      SizedBox(height: 16),

                      // Sign up text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account? ', style: TextStyle(color: Colors.blue[100])),
                          TextButton(
                            onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>register()));
                            },
                            child: Text('Sign Up', style: TextStyle(color: Colors.blueAccent)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}