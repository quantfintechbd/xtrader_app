import 'package:flutter/material.dart';

@immutable
class LoginState {
  final bool isValid;
  final TextEditingController userIdController;
  final TextEditingController passwordController;
  final bool shouldShowPassword, isUserIdFocued, isPasswordFocused;
  const LoginState({
    required this.userIdController,
    required this.passwordController,
    required this.isValid,
    required this.shouldShowPassword,
    required this.isUserIdFocued,
    required this.isPasswordFocused,
  });

  LoginState copyWith({
    bool? isValid,
    bool? shouldShowPassword,
    bool? isUserIdFocued,
    bool? isPasswordFocused,
  }) {
    return LoginState(
      isValid: isValid ?? this.isValid,
      userIdController: this.userIdController,
      passwordController: this.passwordController,
      shouldShowPassword: shouldShowPassword ?? this.shouldShowPassword,
      isUserIdFocued: isUserIdFocued ?? this.isUserIdFocued,
      isPasswordFocused: isPasswordFocused ?? this.isPasswordFocused,
    );
  }
}
