import 'package:flutter/material.dart';
import 'package:budget_pal/core/routing/routes.dart';
import '../../../../core/theming/fonts.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account?',
          style: FontHelper.font13WhiteW300,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.login);
          },
          child: const Text('Log In'),
        ),
      ],
    );
  }
}
