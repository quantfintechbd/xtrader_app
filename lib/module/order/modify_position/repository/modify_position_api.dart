import 'package:dio/dio.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../../../../constant/app_url.dart';
import '/data_provider/api_client.dart';

class ModifyPositionApi {
  final ApiClient _apiClient = ApiClient();

  ModifyPositionApi();

  Future requestModify({
    required Map<String, dynamic> map,
    required Function(Response response) onSuccess,
  }) async {
    await _apiClient
        .request(
            method: Method.POST,
            url: AppUrl.modifyOrder.url,
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
