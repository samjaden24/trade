import 'package:flutter/material.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue,
        centerTitle: true,
        title: Text("Registration"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                        labelText: "First Name",
                        hintText: "Enter Your First Name"
                      ),
                  ),),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        hintText: "Enter Your Last Name"
                      ),
                  ),),
                ),
              ],
            ),
          ],
        )),
    );
  }
}