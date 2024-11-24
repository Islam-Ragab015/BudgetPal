import 'package:budget_pal/features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/fonts.dart';
import '../../../../core/widgets/my_text_form_field.dart';

class SignUpFormField extends StatefulWidget {
  const SignUpFormField({super.key});

  @override
  State<SignUpFormField> createState() => _SignUpFormFieldState();
}

class _SignUpFormFieldState extends State<SignUpFormField> {
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();

    return Form(
      key: signupCubit.formKey, // Use the form key from SignupCubit
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Create an account to start saving!',
              style: FontHelper.font16RegularWhite),
          verticalSpace(20),
          const Text('Name', style: FontHelper.font18BoldWhite),
          verticalSpace(10),
          MyTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                return 'Name can only contain letters and spaces';
              }
              return null;
            },
            controller: signupCubit.nameController,
            hintText: 'Enter your full name',
            isObsecure: false,
          ),
          verticalSpace(20),
          const Text('Email', style: FontHelper.font18BoldWhite),
          verticalSpace(10),
          MyTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
            controller: signupCubit.emailController,
            hintText: 'Enter your email',
            isObsecure: false,
          ),
          verticalSpace(20),
          const Text('Password', style: FontHelper.font18BoldWhite),
          verticalSpace(10),
          MyTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              }
              return null;
            },
            controller: signupCubit.passwordController,
            isObsecure: isObscurePassword,
            suffixIcon: IconButton(
              icon: isObscurePassword
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onPressed: () {
                setState(() {
                  isObscurePassword = !isObscurePassword;
                });
              },
            ),
            hintText: 'Enter your password',
          ),
          verticalSpace(20),
          const Text('Confirm Password', style: FontHelper.font18BoldWhite),
          verticalSpace(10),
          MyTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != signupCubit.passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
            controller: signupCubit.confirmPasswordController,
            isObsecure: isObscureConfirmPassword,
            suffixIcon: IconButton(
              icon: isObscureConfirmPassword
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onPressed: () {
                setState(() {
                  isObscureConfirmPassword = !isObscureConfirmPassword;
                });
              },
            ),
            hintText: 'Re-enter your password',
          ),
        ],
      ),
    );
  }
}
