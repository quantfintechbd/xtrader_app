import 'package:flutter/material.dart';

@immutable
class LoginState {
  final bool isValid;
  final TextEditingController userIdController;
  final TextEditingController passwordController;
  final bool shouldShowPassword;
  LoginState({
    required this.userIdController,
    required this.passwordController,
    required this.isValid,
    required this.shouldShowPassword,
  });

  LoginState copyWith({bool? isValid, bool? shouldShowPassword}) {
    return LoginState(
      isValid: isValid ?? this.isValid,
      userIdController: this.userIdController,
      passwordController: this.passwordController,
      shouldShowPassword: shouldShowPassword ?? this.shouldShowPassword,
    );
  }
}
