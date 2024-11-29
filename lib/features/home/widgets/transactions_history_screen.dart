import 'package:flutter/material.dart';

class TransactionsHistoryScreen extends StatefulWidget {
  const TransactionsHistoryScreen({super.key});

  @override
  State<TransactionsHistoryScreen> createState() =>
      _TransactionsHistoryScreenState();
}

class _TransactionsHistoryScreenState extends State<TransactionsHistoryScreen> {
  bool showRecent = true;

  // Sample data for transactions
  final List<Map<String, String>> allTransactions = [
    {"title": "Grocery", "amount": "\$50", "date": "Nov 25"},
    {"title": "Rent", "amount": "\$1000", "date": "Nov 1"},
    {"title": "Dining Out", "amount": "\$30", "date": "Nov 26"},
    {"title": "Electric Bill", "amount": "\$70", "date": "Nov 20"},
  ];

  final List<Map<String, String>> recentTransactions = [
    {"title": "Dining Out", "amount": "\$30", "date": "Nov 26"},
    {"title": "Grocery", "amount": "\$50", "date": "Nov 25"},
  ];

  @override
  Widget build(BuildContext context) {
    final transactions = showRecent ? recentTransactions : allTransactions;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Transaction",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  ToggleButtons(
                    borderRadius: BorderRadius.circular(30),
                    fillColor: Colors.cyan,
                    selectedColor: Colors.white,
                    color: Colors.white.withOpacity(0.7),
                    isSelected: [showRecent, !showRecent],
                    onPressed: (index) {
                      setState(() {
                        showRecent = index == 0;
                      });
                    },
                    children: const [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text("Recent"),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text("All"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 5.0),
                    child: Card(
                      color: Colors.white.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          transaction["title"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          transaction["date"]!,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        trailing: Text(
                          transaction["amount"]!,
                          style: const TextStyle(
                            color: Colors.cyan,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
