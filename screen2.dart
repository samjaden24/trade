import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => Screen2State();
}

class Screen2State extends State<Screen2> {

  List<Widget> pages=[
    Text("Page 0",style: TextStyle(fontSize: 30),),
    Text("Page 1",style: TextStyle(fontSize: 30),),
    Text("Page 2",style: TextStyle(fontSize: 30),)
  ];

  int selectedIndex=0;
  int text1=1;

  @override
  void initState() {
    super.initState();
    selectedIndex=1;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "{$text1}",style: TextStyle(fontSize: 50),
            ),
            pages[selectedIndex],
            ElevatedButton(onPressed: (){
              setState(() {
                text1=0;
              });
            }, child: Text("Reset"))
          ],
        ),
      ),floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          text1++;
        });
      },child: Icon(Icons.add),),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(label: "Profile",icon: Icon(Icons.person)),
        BottomNavigationBarItem(label: "Settings",icon: Icon(Icons.settings)),
        BottomNavigationBarItem(label: "Home",icon: Icon(Icons.home))
      ]),
    );
  }
}
