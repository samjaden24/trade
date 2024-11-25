import 'package:flutter/material.dart';

class ClientTradeApproval extends StatefulWidget {
  const ClientTradeApproval({super.key});

  @override
  State<ClientTradeApproval> createState() => _ClientTradeApprovalState();
}

class _ClientTradeApprovalState extends State<ClientTradeApproval> {
  // Sample data for client trades
  List<Map<String, dynamic>> trades = [
    {
      "clientId": "CL001",
      "tradeId": "T001",
      "stockName": "Apple",
      "stockPrice": 150.0,
      "quantity": 10,
      "totalPrice": 1500.0,
      "status": "Pending",
    },
    {
      "clientId": "CL002",
      "tradeId": "T002",
      "stockName": "Tesla",
      "stockPrice": 250.0,
      "quantity": 5,
      "totalPrice": 1250.0,
      "status": "Approved",
    },
    {
      "clientId": "CL003",
      "tradeId": "T003",
      "stockName": "Amazon",
      "stockPrice": 120.0,
      "quantity": 20,
      "totalPrice": 2400.0,
      "status": "Pending",
    },
    {
      "clientId": "CL004",
      "tradeId": "T004",
      "stockName": "Microsoft",
      "stockPrice": 300.0,
      "quantity": 3,
      "totalPrice": 900.0,
      "status": "Pending",
    },
  ];

  // Method to approve a trade
  void approveTrade(int index) {
    setState(() {
      trades[index]["status"] = "Approved";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: trades.length,
        itemBuilder: (BuildContext context, int index) {
          final trade = trades[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Client ID: ${trade["clientId"]}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Trade ID: ${trade["tradeId"]}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Stock Name: ${trade["stockName"]}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Stock Price: \$${trade["stockPrice"]}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Quantity: ${trade["quantity"]}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Total Price: \$${trade["totalPrice"]}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Status: ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: trade["status"],
                            style: TextStyle(
                              fontSize: 14,
                              color: trade["status"] == "Approved"
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: trade["status"] == "Pending"
                            ? () => approveTrade(index)
                            : null, // Disable if already approved
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          disabledBackgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          trade["status"] == "Pending"
                              ? "Approve"
                              : "Approved",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
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
