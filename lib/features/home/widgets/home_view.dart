import 'package:flutter/material.dart';
import 'add_transaction_screen.dart'; // Import the AddTransactionScreen
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/fonts.dart';
import 'balance_widget.dart';
import 'expense_tile_widget.dart';
import 'my_app_bar.dart';
import 'percents_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String filter = 'All';

  final List<Map<String, String>> transactions = [
    {"title": "Salary", "amount": "\$5000", "type": "Income"},
    {"title": "Rent", "amount": "\$1500", "type": "Expenses"},
    {"title": "Groceries", "amount": "\$200", "type": "Expenses"},
    {"title": "Savings", "amount": "\$1000", "type": "Savings"},
  ];

  @override
  Widget build(BuildContext context) {
    final filteredTransactions = transactions.where((transaction) {
      if (filter == 'All') {
        return true;
      }
      return transaction["type"] == filter;
    }).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(10),
              const MyAppBar(),
              verticalSpace(10),
              const BalanceWidget(),
              verticalSpace(20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Top Transactions',
                  style: FontHelper.font18BoldWhite.copyWith(
                    color: Colors.cyan,
                  ),
                ),
              ),
              verticalSpace(20),
              const PercentsWidget(),
              verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transactions",
                    style: FontHelper.font18BoldWhite.copyWith(
                      color: Colors.cyan,
                    ),
                  ),
                  Row(
                    children: [
                      // Filter Icon Button
                      IconButton(
                        icon: const Icon(
                          Icons.filter_list,
                          color: Colors.cyan,
                        ),
                        onPressed: () {
                          _showFilterDialog(context);
                        },
                      ),
                      // Add Transaction Button
                      TextButton.icon(
                        onPressed: () {
                          // Navigate to the AddTransactionScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AddTransactionScreen()),
                          );
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.cyan,
                        ),
                        label: const Text(
                          'Add Transaction',
                          style: TextStyle(color: Colors.cyan),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpace(20),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: filteredTransactions.length,
                  itemBuilder: (context, index) {
                    final transaction = filteredTransactions[index];
                    return ExpenseTileWidget(
                      title: transaction["title"]!,
                      amount: transaction["amount"]!,
                      type: transaction["type"]!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Filter Transactions',
            style: FontHelper.font18BoldWhite.copyWith(
              color: Colors.cyan,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildFilterOption(context, 'All Transactions', 'All'),
              _buildFilterOption(context, 'Income', 'Income'),
              _buildFilterOption(context, 'Expenses', 'Expenses'),
              _buildFilterOption(context, 'Savings', 'Savings'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterOption(
      BuildContext context, String label, String filterType) {
    return ListTile(
      title: Text(
        label,
        style: FontHelper.font18White.copyWith(color: Colors.white),
      ),
      leading: Icon(
        filter == filterType ? Icons.check_circle : Icons.circle_outlined,
        color: Colors.cyan,
      ),
      onTap: () {
        setState(() {
          filter = filterType;
        });
        Navigator.pop(context);
      },
    );
  }
}
