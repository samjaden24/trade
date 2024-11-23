import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Map<String, dynamic>> orders = [
    {
      'orderId': 'ORD12345',
      'productName': 'HDFC Scheme',
      'price': 2345.00,
    },
    {
      'orderId': 'ORD12346',
      'productName': 'Apple Stock',
      'price': 2345.09,
    },
    {
      'orderId': 'ORD12347',
      'productName': 'Google Stock',
      'price': 2350.00,
    },
  ];

  List<bool> selectedSteps = List.generate(3, (index) => false);
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                elevation: 10,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: Color.fromARGB(255, 245, 245, 245),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            orders[index]['productName'],
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Order ID: ${orders[index]['orderId']}',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            '\$${orders[index]['price'].toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          selectedSteps[index]
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: Colors.blueAccent,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedSteps[index] = !selectedSteps[index];
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // Display the Stepper below the card if expanded
              if (selectedSteps[index])
                Container(
                  padding: EdgeInsets.all(8),
                  color: Color.fromARGB(255, 240, 240, 240),
                  child: Stepper(
                    currentStep: _index,
                    onStepCancel: () {
                      if (_index > 0) {
                        setState(() {
                          _index -= 1;
                        });
                      }
                    },
                    onStepContinue: () {
                      if (_index < 2) {
                        setState(() {
                          _index += 1;
                        });
                      }
                    },
                    onStepTapped: (int index) {
                      setState(() {
                        _index = index;
                      });
                    },
                    steps: <Step>[
                      Step(
                        stepStyle: StepStyle(connectorColor: Colors.green),
                        title: Text('Stock Purchased'),
                        content: Text('Your order has been placed successfully.'),
                      ),
                      Step(
                        title: Text('Bill Approval Status'),
                        content: Text('Admin Approved'),
                      ),
                   
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
