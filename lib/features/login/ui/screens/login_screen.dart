import 'package:budget_pal/core/helpers/spacing.dart';
import 'package:budget_pal/core/theming/fonts.dart';
import 'package:budget_pal/core/theming/my_colors.dart';
import 'package:budget_pal/core/widgets/my_button.dart';
import 'package:budget_pal/features/login/ui/widgets/dont_have_an_account.dart';
import 'package:flutter/material.dart';
import '../widgets/email_and_password.dart';
import '../widgets/terms_and_conditions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyColors.blackColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(150),
              const EmailAndPassword(),
              verticalSpace(20),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: FontHelper.font18BoldWhite,
                ),
              ),
              verticalSpace(50),
              const MyButton(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.0, 1.0],
                      colors: [MyColors.orangeColor, MyColors.yellowColor]),
                  onPressed: null,
                  child: Text(
                    'Login',
                    style: FontHelper.font18BoldWhite,
                  )),
              verticalSpace(20),
              const TermsAndConditions(),
              verticalSpace(20),
              const DontHaveAnAccount(),
            ],
          ),
        )));
  }
}
