import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            flex: 40,
            child: Row(
              children: [
                Expanded(
                  flex: 33,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
                Expanded(
                    flex: 33,
                    child: Container(
                      color: Colors.brown,
                    )),
                Expanded(
                    flex: 33,
                    child: Container(
                      color: Colors.pink,
                    ))
              ],
            )),
        Expanded(
            flex: 20,
            child: Row(
              children: [
                Expanded(
                  flex: 60,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                    flex: 40,
                    child: Container(
                      color: Colors.cyan,
                    ))
              ],
            )),
        Expanded(
            flex: 10,
            child: Row(
              children: [
                Expanded(
                  flex: 20,
                  child: Container(
                    color: Colors.orange,
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 40,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    color: Colors.yellow,
                  ),
                ),
              ],
            )),
        Expanded(
            flex: 30,
            child: Row(
              children: [
                Expanded(
                  flex: 30,
                  child: Container(
                  color: Colors.deepPurple,
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: Container(
                  color: Colors.lightBlue,
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: Container(
                  color: Colors.blueGrey,
                  ),
                ),
              ],
            ))
      ],
    ));
  }
}
