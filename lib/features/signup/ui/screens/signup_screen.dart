import 'package:budget_pal/features/signup/ui/widgets/signup_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budget_pal/core/helpers/spacing.dart';
import 'package:budget_pal/core/theming/fonts.dart';
import 'package:budget_pal/core/theming/my_colors.dart';
import 'package:budget_pal/core/widgets/my_button.dart';
import 'package:budget_pal/features/signup/logic/cubit/signup_cubit.dart';
import 'package:budget_pal/features/signup/ui/widgets/signup_form_field.dart';
import 'package:budget_pal/features/login/ui/widgets/terms_and_conditions.dart';
import 'package:budget_pal/features/signup/ui/widgets/already_have_an_account.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.blackColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignUpFormField(),
              verticalSpace(50),
              MyButton(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [MyColors.orangeColor, MyColors.yellowColor],
                ),
                onPressed: () => validateThenSignup(context),
                child: Text(
                  'Sign Up',
                  style: FontHelper.font18BoldWhite.copyWith(
                    fontSize: 20,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
              verticalSpace(20),
              const TermsAndConditions(),
              verticalSpace(20),
              const AlreadyHaveAnAccount(),
              verticalSpace(20),
              const SignUpListenerWidget(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenSignup(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();

    // Perform the form validation using the SignupCubit formKey
    if (signupCubit.formKey.currentState?.validate() ?? false) {
      signupCubit.signup();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          content: const Text('Please fill in all required fields.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
