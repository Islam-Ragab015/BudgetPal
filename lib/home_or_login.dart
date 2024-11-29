import 'package:budget_pal/features/home/home_screen.dart';
import 'package:budget_pal/features/login/ui/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeOrLogin extends StatelessWidget {
  const HomeOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;
            if (user == null) {
              // there is no user
              return const LoginScreen();
            } else {
              // there is a user
              return const HomeScreen();
            }
          }
          return const CircularProgressIndicator();
        });
  }
}
