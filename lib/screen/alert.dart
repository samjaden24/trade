import 'package:flutter/material.dart';
import 'package:flutterproject/screen/dashboard.dart';


class Alert extends StatefulWidget {
  const Alert({super.key});

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {

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
              Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),));
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