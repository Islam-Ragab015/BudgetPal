import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/fonts.dart';
import '../../../../core/widgets/my_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({
    super.key,
  });

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObsecure = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    // Initialize the controllers
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // Dispose of the controllers to free up resources
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Welcome Back!',
          style: FontHelper.font28SemiBoldWhite,
        ),
        verticalSpace(30),
        const Text(
          'Email',
          style: FontHelper.font18BoldWhite,
        ),
        verticalSpace(10),
        MyTextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
          controller: emailController,
          hintText: 'Enter your email',
          isObsecure: false,
        ),
        verticalSpace(20),
        const Text(
          'Password',
          style: FontHelper.font18BoldWhite,
        ),
        verticalSpace(10),
        MyTextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
          controller: passwordController,
          isObsecure: isObsecure,
          suffixIcon: IconButton(
            icon: isObsecure
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
            onPressed: () {
              setState(() {
                isObsecure = !isObsecure;
              });
            },
          ),
          hintText: 'Enter your Password',
        ),
      ],
    ));
  }
}
