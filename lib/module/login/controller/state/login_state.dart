import 'package:flutter/material.dart';
import 'package:xtrader_app/module/login/model/broker_list_response.dart';

@immutable
class LoginState {
  final bool isValid;
  final TextEditingController userIdController;
  final TextEditingController passwordController;
  final bool shouldShowPassword, isUserIdFocued, isPasswordFocused;
  final List<Broker>? brokers, filteredBroker;
  final Broker? selectedBroker;
  const LoginState({
    required this.userIdController,
    required this.passwordController,
    required this.isValid,
    required this.shouldShowPassword,
    required this.isUserIdFocued,
    required this.isPasswordFocused,
    this.brokers,
    this.filteredBroker,
    this.selectedBroker,
  });

  LoginState copyWith({
    bool? isValid,
    bool? shouldShowPassword,
    bool? isUserIdFocued,
    bool? isPasswordFocused,
    List<Broker>? brokers,
    List<Broker>? filteredBroker,
    Broker? selectedBroker,
  }) {
    return LoginState(
      isValid: isValid ?? this.isValid,
      userIdController: this.userIdController,
      passwordController: this.passwordController,
      shouldShowPassword: shouldShowPassword ?? this.shouldShowPassword,
      isUserIdFocued: isUserIdFocued ?? this.isUserIdFocued,
      isPasswordFocused: isPasswordFocused ?? this.isPasswordFocused,
      brokers: brokers ?? this.brokers,
      selectedBroker: selectedBroker ?? this.selectedBroker,
      filteredBroker: filteredBroker ?? this.brokers,
    );
  }
}
