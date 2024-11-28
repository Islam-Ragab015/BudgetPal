import 'package:budget_pal/features/transactions/my_chart.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(child: MyChart()),
    );
  }
}
