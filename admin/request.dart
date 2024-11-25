import 'package:flutter/material.dart';

class ClientKycStatus extends StatefulWidget {
  const ClientKycStatus({super.key});

  @override
  State<ClientKycStatus> createState() => _ClientKycStatusState();
}

class _ClientKycStatusState extends State<ClientKycStatus> {
  // Sample data for clients
  List<Map<String, dynamic>> clients = [
    {
      "clientId": "CL001",
      "email": "client1@example.com",
      "phone": "9876543210",
      "panCard": "ABCDE1234F",
      "kycStatus": "Pending",
    },
    {
      "clientId": "CL002",
      "email": "client2@example.com",
      "phone": "9123456789",
      "panCard": "FGHIJ5678K",
      "kycStatus": "Active",
    },
    {
      "clientId": "CL003",
      "email": "client3@example.com",
      "phone": "9123451234",
      "panCard": "KLMNO9012P",
      "kycStatus": "Pending",
    },
    {
      "clientId": "CL004",
      "email": "client4@example.com",
      "phone": "9876541234",
      "panCard": "QRSTU3456X",
      "kycStatus": "Active",
    },
  ];

  // Method to toggle KYC status
  void toggleKycStatus(int index) {
    setState(() {
      clients[index]["kycStatus"] =
          clients[index]["kycStatus"] == "Pending" ? "Active" : "Pending";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: const Text("Client KYC Status"),
      //   centerTitle: true,
      // ),
      body: ListView.builder(
        itemCount: clients.length,
        itemBuilder: (BuildContext context, int index) {
          final client = clients[index];
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
                      "Client ID: ${client["clientId"]}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Email: ${client["email"]}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Phone: ${client["phone"]}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "PAN Card: ${client["panCard"]}",
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
                            text: "KYC Status: ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: client["kycStatus"],
                            style: TextStyle(
                              fontSize: 14,
                              color: client["kycStatus"] == "Active"
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
                        onPressed: () {
                          toggleKycStatus(index);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          client["kycStatus"] == "Pending"
                              ? "Activate"
                              : "Deactivate",
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
