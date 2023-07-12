import 'package:dio/dio.dart';
import 'package:xtrader_app/constant/app_url.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/extension.dart';

import '/data_provider/api_client.dart';

class LoginApi {
  final ApiClient _apiClient = ApiClient();

  LoginApi();

  Future requestLogin({
    required Map<String, dynamic> map,
    required onSuccess(Response response),
  }) async {
    await _apiClient
        .request(
            method: Method.POST,
            url: AppUrl.login.url,
            params: map,
            isPopGlobalDialog: true,
            shouldShowError: true,
            onSuccessFunction: await (Response response) {
              onSuccess(response);
            })
        .catchError((error, stackTrace) {
      "api on error ${error}".log();
      throw Exception(error);
    });
  }

  Future brokerList({
    required onSuccess(Response response),
  }) async {
    await _apiClient
        .request(
            method: Method.GET,
            url: AppUrl.brokerList.url,
            isPopGlobalDialog: true,
            onSuccessFunction: await (Response response) {
              onSuccess(response);
            })
        .catchError((error, stackTrace) {
      "api on error ${error}".log();
      throw Exception(error);
    });
  }
}
