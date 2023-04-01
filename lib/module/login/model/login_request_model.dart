import 'package:flutter/material.dart';

class LoginRequesteModel {
  String userName, password;
  LoginRequesteModel({required this.userName, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': userName,
      'password': password,
    };
  }
}
