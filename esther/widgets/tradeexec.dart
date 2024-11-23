// import 'package:flutter/material.dart';

// class Tradeexec extends StatefulWidget {
//   const Tradeexec({super.key});

//   @override
//   State<Tradeexec> createState() => _TradeexecState();
// }

// class _TradeexecState extends State<Tradeexec> {

//   List<Map<String,dynamic>>stocks= [
//     {'schemeName':'HDFC','isin':'TFGRE123','currentPrice':2345.00},
//       {'schemeName':'Apple','isin':'TFGRE123','currentPrice':2345.09},  {'schemeName':'HDFC','isin':'TFGRE123','currentPrice':2345.09},  {'schemeName':'HDFC','isin':'TFGRE123','currentPrice':2345.09},
//       {'schemeName':'HDFC','isin':'TFGRE123','currentPrice':2345.09},{'schemeName':'HDFC','isin':'TFGRE123','currentPrice':2345.09},
//       {'schemeName':'HDFC','isin':'TFGRE123','currentPrice':2345.09},
//       {'schemeName':'HDFC','isin':'TFGRE123','currentPrice':2345.09}
//     ];

// void showBottomSheet(BuildContext context){
//   showModalBottomSheet(
//     context: context,
//     isDismissible: false,
//    builder: (context){
//     return Container(
//       color: const Color.fromARGB(255, 234, 209, 238),
//       height: MediaQuery.of(context).size.height*0.3,
//       width:double.infinity,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Scheme Name: ${stocks[0]['schemeName']}",style: TextStyle(fontSize: 20)),
              
//                 Text("ISIN number: ${stocks[0]['isin']}",style: TextStyle(fontSize: 20)),
          
//                  Text("Current Price: ${stocks[0]['currentPrice']}",style: TextStyle(fontSize: 20)),
//                   Text("Estimated Total: 2023.90",style: TextStyle(fontSize: 20),
//                 ),
//                ElevatedButton(onPressed: (){

//                }, child: Text("BUY"))
//               ],
//               ),
//           ),
//            IconButton(onPressed: (){
//                   Navigator.pop(context);
//                 }, icon: Icon(Icons.close_rounded))
//         ],
//       )

//     );
//   });
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ListView.builder(
//           itemCount: stocks.length,
//           itemBuilder: (context,index){
//             return Card(
//               elevation: 20,
//               shadowColor: Colors.amber.shade50,
//               shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(20))),
//           color: const Color.fromARGB(255, 194, 177, 241),
//               child: Padding(
//         padding: EdgeInsets.all(8),
//         child:Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//          children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [ Text(stocks[index]['schemeName'],style: TextStyle(fontSize: 20),),
//                       Text(stocks[index]['isin'],style: TextStyle(fontSize: 20),),
//                       Text(stocks[index]['currentPrice'].toString(),style: TextStyle(fontSize: 20),)],
//             ),
//           ),ElevatedButton(onPressed: (){
//             showBottomSheet(context);
//           }, child: Text("Buy"))
//          ]
          
//         )
//         )
//         );
          
//           })
//         );
//              }
// }















// // Row(
// //                           mainAxisAlignment: MainAxisAlignment.start,
// //                           crossAxisAlignment: CrossAxisAlignment.end,
// //                           children: [ElevatedButton(onPressed: (){}, child: Text("Buy")






















import 'package:flutter/material.dart';

class Tradeexec extends StatefulWidget {
  const Tradeexec({super.key});

  @override
  State<Tradeexec> createState() => _TradeexecState();
}

class _TradeexecState extends State<Tradeexec> {
  List<Map<String, dynamic>> stocks = [
    {'schemeName': 'HDFC', 'isin': 'TFGRE123', 'currentPrice': 2345.00},
    {'schemeName': 'Apple', 'isin': 'TFGRE123', 'currentPrice': 2345.09},
    {'schemeName': 'HDFC', 'isin': 'TFGRE123', 'currentPrice': 2345.09},
    {'schemeName': 'HDFC', 'isin': 'TFGRE123', 'currentPrice': 2345.09},
    {'schemeName': 'HDFC', 'isin': 'TFGRE123', 'currentPrice': 2345.09},
    {'schemeName': 'HDFC', 'isin': 'TFGRE123', 'currentPrice': 2345.09},
    {'schemeName': 'HDFC', 'isin': 'TFGRE123', 'currentPrice': 2345.09},
    {'schemeName': 'HDFC', 'isin': 'TFGRE123', 'currentPrice': 2345.09}
  ];

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (context) {
        return Container(
          color: Color.fromARGB(255, 234, 209, 238),
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Scheme Name: ${stocks[0]['schemeName']}",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "ISIN number: ${stocks[0]['isin']}",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Current Price: \$${stocks[0]['currentPrice'].toString()}",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    TextFormField(),
                    Text(
                      "Estimated Total: 2023.90",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("BUY"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close_rounded, size: 30),
                color: Colors.black,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: stocks.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            color: Color.fromARGB(255, 245, 245, 245),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Column to display stock info
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stocks[index]['schemeName'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 6),
                        Text(
                          stocks[index]['isin'],
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 6),
                        Text(
                          '\$${stocks[index]['currentPrice'].toString()}',
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  // Elevated button to show bottom sheet
                  ElevatedButton(
                    onPressed: () {
                      showBottomSheet(context);
                    },
                    child: Text("BUY"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 109, 224, 240),
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
