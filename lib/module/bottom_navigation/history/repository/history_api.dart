import 'package:dio/dio.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../../../../constant/app_url.dart';
import '../../../../utils/enum.dart';
import '/data_provider/api_client.dart';

class HistoryApi {
  final ApiClient _apiClient = ApiClient();

  HistoryApi();
  Future fetchHistory(
      {required Map<String, dynamic> map,
      required Function(Response response) onSuccess}) async {
    await _apiClient
        .request(
            method: Method.POST,
            url: AppUrl.getHistory.url,
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
