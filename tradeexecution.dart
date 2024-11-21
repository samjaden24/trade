import 'package:flutter/material.dart';

class Tradeexecution extends StatefulWidget {
  const Tradeexecution({super.key});

  @override
  State<Tradeexecution> createState() => _TradeexecutionState();
}

class _TradeexecutionState extends State<Tradeexecution> {

  bottomSheet(){
    return showModalBottomSheet(
      
      // isDismissible: false,
      context: context, builder: (context) {
      return Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Scheme Name:"),Text("ISIN:"), Text("Unit Price:"), TextField(
                decoration: InputDecoration(
                  hintText: "Quantity"
                ),
              ),Text("Total Price:"),ElevatedButton(onPressed: (){}, child: Center(child: Text("Place Order")))
            ],
          ),
        ),
      );
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("StockName:NiftyFifty"),
                      Text("ISIN:INE0J1Y01017"),
                      Text("Current Price:2000")
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(onPressed: (){
                        bottomSheet();
                      }, child: Text("Buy"))
                    ],
                  )
                  
                ],
              ),
            ),
          ),
        ],
      );
          }),
    );
      
  }
}