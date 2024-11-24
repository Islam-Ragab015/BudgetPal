import 'package:budget_pal/core/networking/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final FirebaseHelper firebaseHelper;
  SignupCubit(this.firebaseHelper) : super(SignupInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Method to trigger signup and handle validation
  signup() async {
    if (formKey.currentState?.validate() ?? false) {
      if (passwordController.text != confirmPasswordController.text) {
        emit(SignupErrorState("Passwords do not match"));
        return;
      }

      emit(SignupLoadingState());
      try {
        await firebaseHelper
            .registerUser(
                emailController.text.trim(), passwordController.text.trim())
            .then((value) => emit(SignupSuccessState()));
      } catch (e) {
        emit(SignupErrorState(e.toString()));
      }
    } else {
      emit(SignupErrorState("Please fix the errors in the form"));
    }
  }
}
