import 'package:flutter/material.dart';

class Tradehistory extends StatefulWidget {
  const Tradehistory({super.key});

  @override
  State<Tradehistory> createState() => _TradehistoryState();
}

class _TradehistoryState extends State<Tradehistory> {
  final List<Map<String, dynamic>> trades = [
    {
      "stockName": "Reliance SmallCap",
      "quantity": 10,
      "unitPrice": 480,
      "totalPrice": 4800,
    },
    {
      "stockName": "Tata Consumer",
      "quantity": 5,
      "unitPrice": 450,
      "totalPrice": 2250,
    },
  ];

  late List<int> currentSteps;
  late List<bool> isStepperCompleted;

  @override
  void initState() {
    super.initState();
    currentSteps = List<int>.generate(trades.length, (index) => 0);
    isStepperCompleted = List<bool>.generate(trades.length, (index) => false);
  }

  Widget buildStepper(int index) {
    if (isStepperCompleted[index]) return const SizedBox.shrink();

    return Theme(
      data: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.green, // Active step color
              secondary: Colors.green, // Connector color
            ),
      ),child: Stepper(
      currentStep: currentSteps[index],
      onStepCancel: () {
        if (currentSteps[index] > 0) {
          setState(() {
            currentSteps[index] -= 1;
          });
        }
      },
      onStepContinue: () {
        if (currentSteps[index] < 2) {
          setState(() {
            currentSteps[index] += 1;
          });
        } else {
          setState(() {
            isStepperCompleted[index] = true;
          });
        }
      },
      onStepTapped: (int tappedIndex) {
        setState(() {
          currentSteps[index] = tappedIndex;
        });
      },
      controlsBuilder: (context, details) {
        final isLastStep = currentSteps[index] == 2;

        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: details.onStepContinue,
              child: Text(isLastStep ? 'Finish' : 'Next'),
            ),
            const SizedBox(width: 8),
            if (!isLastStep)
              ElevatedButton(
                onPressed: details.onStepCancel,
                child: const Text('Back'),
              ),
          ],
        );
      },
      steps: [
        Step(
          title: const Text('Purchase Status'),
          content: const Text('Purchased successfully.'),
          isActive: currentSteps[index] >= 0,
          state:
              currentSteps[index] > 0 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: const Text('Admin Approval Status'),
          content: const Text('Approved by admin.'),
          isActive: currentSteps[index] >= 1,
          state:
              currentSteps[index] > 1 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: const Text('Order Status'),
          content: const Text('Order processed successfully.'),
          isActive: currentSteps[index] >= 2,
          state:
              currentSteps[index] == 2 ? StepState.complete : StepState.indexed,
        ),
      ],
    )
    );
  }

  Widget buildTradeCard(Map<String, dynamic> trade, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Stock Name: ${trade['stockName']}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Quantity: ${trade['quantity']}",
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              "Unit Price: ₹${trade['unitPrice']}",
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Total Price: ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: "₹${trade['totalPrice']}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            buildStepper(index),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: trades.length,
        itemBuilder: (context, index) {
          return buildTradeCard(trades[index], index);
        },
      ),
    );
  }
}
