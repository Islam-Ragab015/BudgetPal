import 'package:budget_pal/core/routing/routes.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/fonts.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Dont have an account?',
          style: FontHelper.font13WhiteW300,
        ),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.signup);
            },
            child: const Text('Sign Up'))
      ],
    );
  }
}
