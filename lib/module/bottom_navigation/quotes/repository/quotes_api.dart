import 'package:dio/dio.dart';
import 'package:xtrader_app/constant/app_url.dart';
import 'package:xtrader_app/utils/enum.dart';

import '/data_provider/api_client.dart';

class QuotesApi {
  final ApiClient _apiClient = ApiClient();

  QuotesApi();

  Future loadQuotes({
    required Map<String, dynamic> params,
    required Function(Response response) onSuccess,
  }) async {
    await _apiClient
        .request(
            url: AppUrl.quotesDetails.url,
            method: Method.POST,
            params: params,
            onSuccessFunction: (Response response) {
              onSuccess(response);
            })
        .catchError((Object v) {
      throw Exception(v);
    });
  }
}
