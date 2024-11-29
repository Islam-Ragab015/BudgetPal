part of 'signup_cubit.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupErrorState extends SignupState {
  final String message;
  SignupErrorState(this.message);
}

class SignupSuccessState extends SignupState {}
