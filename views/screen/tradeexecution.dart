import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class Tradeexecution extends StatefulWidget {
  const Tradeexecution({super.key});

  @override
  State<Tradeexecution> createState() => _TradeexecutionState();
}

class _TradeexecutionState extends State<Tradeexecution> {
  List<Map<String, dynamic>> stocks = [
    {
      "stockName": "Reliance SmallCap",
      "isin": "INE123B01012",
      "currentPrice": 480
    },
    {"stockName": "Tata Consumer", "isin": "INE192A01025", "currentPrice": 450},
    {
      "stockName": "ICICI GrowthFund",
      "isin": "INE756C01019",
      "currentPrice": 300
    },
    {"stockName": "Axis Bluechip", "isin": "INE238D01022", "currentPrice": 350},
    {
      "stockName": "HDFC Midcap Opp.",
      "isin": "INE001K01021",
      "currentPrice": 400
    },
    {
      "stockName": "SBI Savings Plan",
      "isin": "INE678E01013",
      "currentPrice": 250
    },
    {
      "stockName": "Kotak FlexiCap",
      "isin": "INE976F01017",
      "currentPrice": 500
    },
    {
      "stockName": "UTI Equity Fund",
      "isin": "INE909G01029",
      "currentPrice": 300
    },
    {
      "stockName": "Sundaram Balanced",
      "isin": "INE432H01033",
      "currentPrice": 400
    },
    {
      "stockName": "Aditya Birla Fund",
      "isin": "INE234I01018",
      "currentPrice": 300
    },
  ];

  bottomSheet(int index) {
  final stock = stocks[index];
  num totalPrice = stock["currentPrice"];
  int quantity = 1;

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setBottomSheetState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 16,
              left: 16,
              right: 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Order Details",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Scheme Name: ${stock["stockName"]}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "ISIN: ${stock["isin"]}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Unit Price: ₹${stock["currentPrice"]}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),
                  // TextField(
                  //   keyboardType: TextInputType.number,
                  //   decoration: InputDecoration(
                  //     labelText: "Quantity",
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     prefixIcon: Icon(Icons.shopping_cart_outlined),
                  //   ),
                  //   onChanged: (value) {
                  //     int newQuantity = int.tryParse(value) ?? 1;
                  //     setBottomSheetState(() {
                  //       quantity = newQuantity;
                  //       totalPrice = quantity*stock["currentPrice"];
                  //     });
                  //   },
                  // ),
                  SpinBox(
                    min: 1,
                    value: 1,
                    onChanged: (value) {
                      setBottomSheetState(() {
                        quantity = value.toInt();
                        totalPrice = quantity * stock["currentPrice"];
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Total Price: ",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: "₹$totalPrice",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle order placement logic here
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        "Place Order",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: Text("Trade Execution"),
      // ),
      body: ListView.builder(
        itemCount: stocks.length,
        itemBuilder: (BuildContext context, int index) {
          final stock = stocks[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Stock Name: ${stock["stockName"]}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "ISIN: ${stock["isin"]}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Current Price: ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: "₹${stock["currentPrice"]}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        bottomSheet(index);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Buy",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}




// child: Text("Buy",style: TextStyle(color: Colors.white,fontSize: 15),),