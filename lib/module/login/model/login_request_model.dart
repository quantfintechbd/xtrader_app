import 'package:flutter/material.dart';

class LoginRequesteModel {
  String userName, password, broker;
  LoginRequesteModel(
      {required this.userName, required this.password, required this.broker});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': userName,
      'password': password,
      'broker': broker,
    };
  }
}
