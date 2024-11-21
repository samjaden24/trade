import 'package:flutter/material.dart';

class Tradeexecution extends StatefulWidget {
  const Tradeexecution({super.key});

  @override
  State<Tradeexecution> createState() => _TradeexecutionState();
}

class _TradeexecutionState extends State<Tradeexecution> {
  final TextEditingController quantityController=TextEditingController();
  double totalPrice=0.0;

  final List<Map<String,dynamic>> stocks=[
    {
      "stockName": "NiftyFifty",
      "isin": "INE0J1Y01017",
      "currentPrice": 2000,
    },
    {
      "stockName": "Reliance Industries",
      "isin": "INE001A01036",
      "currentPrice": 2450,
    },
    {
      "stockName": "Tata Consultancy Services",
      "isin": "INE467B01029",
      "currentPrice": 3800,
    },
    {
      "stockName": "HDFC Bank",
      "isin": "INE040A01034",
      "currentPrice": 1500,
    },
    {
      "stockName": "Infosys",
      "isin": "INE009A01021",
      "currentPrice": 1600,
    },
  ];

getTotalPrice(int index){
    final stock=stocks[index];
    final quantity=double.tryParse(quantityController.text)??0;
    setState(() {
          totalPrice= stock['currentPrice']*quantity;
    });
}


  bottomSheet(int index){
    // int value=index;
    final stock=stocks[index];
 
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
              Text("Scheme Name:${stock["stockName"]}"),
              Text("ISIN:${stock["isin"]}"), 
              Text("Unit Price:${stock['currentPrice']}"), 
              Listener(
                child: TextFormField(
                  controller: quantityController,
                  decoration: InputDecoration(
                    hintText: "Quantity"
                  ),
                  onChanged: (value) {
                    getTotalPrice(index);
                  },
                ),
              ),Text("Total Price:${totalPrice}"),
              ElevatedButton(onPressed: (){}, child: Center(child: Text("Place Order")))
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
          itemCount: stocks.length,
          itemBuilder: (BuildContext context, int index) {
            final stock= stocks[index];
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
                      Text("StockName:${stock["stockName"]}"),
                      Text("ISIN:${stock["isin"]}"),
                      Text("Current Price:${stock["currentPrice"]}")
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(onPressed: (){
                        bottomSheet(index);
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