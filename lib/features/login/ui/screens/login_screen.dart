import 'package:flutter/material.dart';
import 'package:budget_pal/core/helpers/spacing.dart';
import 'package:budget_pal/core/theming/fonts.dart';
import 'package:budget_pal/core/theming/my_colors.dart';
import 'package:budget_pal/core/widgets/my_button.dart';
import 'package:budget_pal/features/login/logic/cubit/login_cubit.dart';
import 'package:budget_pal/features/login/ui/widgets/build_bloc_listener.dart';
import 'package:budget_pal/features/login/ui/widgets/dont_have_an_account.dart';
import '../widgets/email_and_password.dart';
import '../widgets/terms_and_conditions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Allow scrolling when keyboard is open
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(150), // Space before the content
              const EmailAndPassword(),
              verticalSpace(30), // Spacing for better readability
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: FontHelper.font16Regular.copyWith(
                    color: Colors.white
                        .withOpacity(0.7), // Slight opacity for less emphasis
                    fontSize: 14,
                  ),
                ),
              ),
              verticalSpace(50), // Space before button
              MyButton(
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.0, 1.0],
                    colors: [MyColors.orangeColor, MyColors.yellowColor]),
                onPressed: () => validateThenLogin(context),
                child: Text(
                  'Login',
                  style: FontHelper.font18BoldWhite.copyWith(
                    fontSize: 20,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
              verticalSpace(20), // Space before terms and conditions text
              const TermsAndConditions(),
              verticalSpace(20), // Space before the sign-up prompt
              const DontHaveAnAccount(),
              const BuildBlocListener() // Bloc listener for state changes
            ],
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}
