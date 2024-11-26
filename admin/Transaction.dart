import 'package:flutter/material.dart';

class TransactionManagement extends StatefulWidget {
  @override
  _TransactionManagementState createState() => _TransactionManagementState();
}
class Transaction {
  final String transactionDate;
  final String clientId;
  final String tradeId;
  final String stockName;
  final int quantity;
  final String tradeType;
  final String settlementStatus;

  Transaction({
    required this.transactionDate,
    required this.clientId,
    required this.tradeId,
    required this.stockName,
    required this.quantity,
    required this.tradeType,
    required this.settlementStatus,
  });
}

class _TransactionManagementState extends State<TransactionManagement> {
  final _formKey = GlobalKey<FormState>();
  final List<Transaction> _transactions = [];

  // Form fields
  String transactionDate = '';
  String clientId = '';
  String tradeId = '';
  String stockName = '';
  int quantity = 0;
  String? tradeType;
  String? settlementStatus;
  

  final List<String> tradeTypes = ['Buy', 'Sell'];
  final List<String> settlementStatuses = ['Pending', 'Completed'];

  void _updateTransaction() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Add new transaction to the list
      setState(() {
        _transactions.add(
          Transaction(
            transactionDate: transactionDate,
            clientId: clientId,
            tradeId: tradeId,
            stockName: stockName,
            quantity: quantity,
            tradeType: tradeType!,
            settlementStatus: settlementStatus!,
          ),
        );
      });

      // Reset form
      _formKey.currentState!.reset();
      transactionDate = '';
      clientId = '';
      tradeId = '';
      stockName = '';
      quantity = 0;
      tradeType = null;
      settlementStatus = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transaction Management')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Transaction Date'),
                    onSaved: (value) => transactionDate = value ?? '',
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Transaction Date is required' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Client ID'),
                    onSaved: (value) => clientId = value ?? '',
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Client ID is required' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Trade ID'),
                    onSaved: (value) => tradeId = value ?? '',
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Trade ID is required' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Stock Name'),
                    onSaved: (value) => stockName = value ?? '',
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Stock Name is required' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Quantity'),
                    keyboardType: TextInputType.number,
                    onSaved: (value) => quantity = int.tryParse(value ?? '0') ?? 0,
                    validator: (value) =>
                        value == null || int.tryParse(value) == null || int.parse(value) <= 0
                            ? 'Quantity must be greater than 0'
                            : null,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Trade Type'),
                    value: tradeType,
                    items: tradeTypes
                        .map((type) => DropdownMenuItem<String>(
                              value: type,
                              child: Text(type),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() => tradeType = value),
                    validator: (value) =>
                        value == null ? 'Trade Type is required' : null,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Settlement Status'),
                    value: settlementStatus,
                    items: settlementStatuses
                        .map((status) => DropdownMenuItem<String>(
                              value: status,
                              child: Text(status),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() => settlementStatus = value),
                    validator: (value) =>
                        value == null ? 'Settlement Status is required' : null,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _updateTransaction,
                    child: const Text('Update Status'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _transactions.length,
                itemBuilder: (context, index) {
                  final transaction = _transactions[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text('${transaction.tradeId} - ${transaction.stockName}'),
                      subtitle: Text(
                          'Client: ${transaction.clientId}\nDate: ${transaction.transactionDate}\nQuantity: ${transaction.quantity}\nTrade Type: ${transaction.tradeType}\nStatus: ${transaction.settlementStatus}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


