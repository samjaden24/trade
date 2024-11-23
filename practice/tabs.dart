
void main() {
  runApp(const Thinesh());
}


class Thinesh extends StatelessWidget{
  const Thinesh({super.key});


  @override
  Widget build(BuildContext context) {
   return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Tabclass());
  }
}

class Tabclass extends StatefulWidget {
  const Tabclass({super.key});

  @override
  State<Tabclass> createState() => _TabclassState();
}

class _TabclassState extends State<Tabclass> with TickerProviderStateMixin{
late TabController tabController;
  @override
  void initState() {
   tabController= TabController(vsync: this,length:3 );
    super.initState();
  }

  void function(int value){
    print(value);
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [
             TabBar(
              
              controller: tabController,
              tabs: const [
              Tab(child:Text("Tab1") ,),
              Tab(child:Text("Tab2") ,),
              Tab(child:Text("Tab3") ,)            
              ]),
      
              Expanded(child: TabBarView(controller: tabController,
              
                // physics: NeverScrollableScrollPhysics(),
                children: const [
                Screens1(),
                Screens2(),
                Screens3()
              ]))
          ],
        ),
      ),
    );
  }
}



class Screens1 extends StatelessWidget {
  const Screens1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 220, 133),
      body: Center(child: Text("Screen1"),),
    );
  }
}
class Screens2 extends StatelessWidget {
  const Screens2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 166, 210, 247),
      body: Center(child: Text("Screen2"),),
    );
  }
}
class Screens3 extends StatelessWidget {
  const Screens3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 153, 244, 156),
      body: Center(child: Text("Screen3"),),
    );
  }
}
