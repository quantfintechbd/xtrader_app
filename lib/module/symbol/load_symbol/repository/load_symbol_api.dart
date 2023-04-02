import 'package:dio/dio.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../../../../constant/app_url.dart';
import '../../../../utils/enum.dart';
import '/data_provider/api_client.dart';

class LoadSymbolApi {
  final ApiClient _apiClient = ApiClient();

  LoadSymbolApi();

  Future load({
    required Map<String, dynamic> map,
    required onSuccess(Response response),
  }) async {
    await _apiClient
        .request(
            method: Method.POST,
            url: AppUrl.symbolList.url,
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

  Future total({
    required Function(Response response) onSuccess,
  }) async {
    await _apiClient
        .request(
            method: Method.GET,
            url: AppUrl.totalSymbol.url,
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
