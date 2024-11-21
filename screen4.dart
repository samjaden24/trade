import 'package:flutter/material.dart';
import 'package:tradeflutter/screen/screen1.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_){
    //     _showMyDialog();
    // });
    WidgetsBinding.instance.addPostFrameCallback((_){
      _showMyDialog();
    });
  }

  displayDialog(){
    return showDialog(context: context, builder: (context) {
      return AlertDialog();
    },);
  }

  _showMyDialog(){
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Client Activation'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Please Activate the Client!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Send Request'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Screen1(),));
            },
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          ],
      )
    );
  }
}