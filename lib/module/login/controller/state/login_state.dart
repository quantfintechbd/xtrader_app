import 'package:flutter/material.dart';

@immutable
class LoginState {
  final bool isValid;
  final TextEditingController userIdController;
  final TextEditingController passwordController;
  LoginState(
      {required this.userIdController,
      required this.passwordController,
      required this.isValid});

  LoginState copyWith({bool? isValid}) {
    return LoginState(
      isValid: isValid ?? this.isValid,
      userIdController: this.userIdController,
      passwordController: this.passwordController,
    );
  }
}
