import 'package:flutter/material.dart';

import '../theming/fonts.dart';
import '../theming/my_colors.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final bool isObsecure;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const MyTextFormField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      required this.isObsecure,
      required this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isObsecure,
      style: FontHelper.font18GreyW300,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: FontHelper.font18GreyW300,
        filled: true,
        fillColor: MyColors.greyColor,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MyColors.orangeColor, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MyColors.greyColor, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
