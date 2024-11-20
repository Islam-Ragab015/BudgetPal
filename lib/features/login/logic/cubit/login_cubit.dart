import 'package:budget_pal/core/networking/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseHelper firebaseHelper;
  LoginCubit(this.firebaseHelper) : super(LoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  login() async {
    emit(LoginLoadingState());
    try {
      await firebaseHelper
          .loginUser(
              emailController.text.trim(), passwordController.text.trim())
          .then((value) => emit(LoginSuccessState()));
    } catch (e) {
      emit(LoginErrorState());
    }
  }
}
