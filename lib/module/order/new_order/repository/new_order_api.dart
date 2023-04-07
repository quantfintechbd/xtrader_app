import 'package:dio/dio.dart';
import 'package:xtrader_app/constant/app_url.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/extension.dart';

import '/data_provider/api_client.dart';

class NewOrderApi {
  final ApiClient _apiClient = ApiClient();

  NewOrderApi();

  Future requestNewOrder({
    required Map<String, dynamic> map,
    required Function(Response response) onSuccess,
  }) async {
    await _apiClient
        .request(
            method: Method.POST,
            url: AppUrl.newOrder.url,
            params: map,
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
