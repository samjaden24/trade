import 'package:flutter/material.dart';

class Tradehistory extends StatefulWidget {
  const Tradehistory({super.key});

  @override
  State<Tradehistory> createState() => _TradehistoryState();
}

class _TradehistoryState extends State<Tradehistory> {
  int index = 0;
  bool isCompleted = false; // To track if the process is completed

  // This method will handle the stepper UI and logic
  showStepper() {
    return Stepper(
      currentStep: index,
      onStepCancel: () {
        if (index > 0 && !isCompleted) {
          setState(() {
            index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (index < 2 && !isCompleted) {
          setState(() {
            index += 1;
          });
        } else if (index == 2) {
          // Final step, mark as completed
          setState(() {
            isCompleted = true;
          });
        }
      },
      onStepTapped: (int tappedIndex) {
        if (!isCompleted) {
          setState(() {
            index = tappedIndex;
          });
        }
      },
      controlsBuilder: (context, details) {
        if (isCompleted) {
          // No buttons to show if it's completed
          return SizedBox.shrink(); // Return an empty space (no buttons)
        }

        // Custom controls for each step
        final isLastStep = index == 2; // Check if it's the last step (Step 3)
        
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (!isLastStep)
              ElevatedButton(
                onPressed: details.onStepContinue,
                child: const Text('Continue'),
              ),
            if (!isLastStep)
              const SizedBox(width: 8),
            if (!isLastStep)
              ElevatedButton(
                onPressed: details.onStepCancel,
                child: const Text('Cancel'),
              ),
            if (isLastStep)
              ElevatedButton(
                onPressed: () {
                  // Your Done action goes here
                  setState(() {
                    isCompleted = true;
                  });
                  print("Done! Stepper Completed.");
                },
                child: const Text('Done'),
              ),
          ],
        );
      },
      steps: <Step>[
        Step(
          title: const Text('Purchase Status'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Purchased'),
          ),
          isActive: index == 0,
        ),
        const Step(
          title: Text('Admin Approval Status'),
          content: Text('Approved'),
          isActive: true,
        ),
        const Step(
          title: Text('Order Status'),
          content: Text('Failed'),
          isActive: true,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Trade History")),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Stock Name:"),
                    const Text("Quantity:"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Unit Price:"),
                    const Text("Total Price:"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                showStepper(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
