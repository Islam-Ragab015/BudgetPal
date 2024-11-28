import 'package:budget_pal/core/theming/my_colors.dart';
import 'package:budget_pal/features/home/widgets/home_view.dart';
import 'package:budget_pal/features/home/widgets/transactions_history_screen.dart';
import 'package:budget_pal/features/transactions/transactions_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    const TransactionsHistoryScreen(),
    const TransactionsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 0.5],
            colors: [MyColors.redColor, MyColors.navyColor],
          ),
        ),
        child: screens[currentIndex],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.black,
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          child: BottomNavigationBar(
            selectedIconTheme: const IconThemeData(color: Colors.cyan),
            unselectedIconTheme: const IconThemeData(color: Colors.white),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: currentIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.history,
                  size: 30,
                ),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.analytics,
                  size: 30,
                ),
                label: 'Analytics',
              ),
            ],
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
