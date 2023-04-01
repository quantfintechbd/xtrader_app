import 'package:flutter/material.dart';

import '../model/login_request_model.dart';
import '../model/login_response_model.dart';

@immutable
abstract class ILoginRepository {
  Future<void> requestLogin({
    required LoginRequesteModel data,
    required Function(LoginData response) onSuccess,
  });
}
