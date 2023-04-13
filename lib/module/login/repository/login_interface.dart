import 'package:flutter/material.dart';
import 'package:xtrader_app/module/login/model/broker_list_response.dart';

import '../model/login_request_model.dart';
import '../model/login_response_model.dart';

@immutable
abstract class ILoginRepository {
  Future<void> requestLogin({
    required LoginRequesteModel data,
    required Function(LoginData response) onSuccess,
  });
  Future<void> fetchBrokers({
    required Function(List<Broker> response) onSuccess,
  });
}
