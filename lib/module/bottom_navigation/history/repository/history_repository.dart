import 'package:dio/dio.dart';
import 'package:xtrader_app/module/bottom_navigation/history/model/history_response.dart';
import 'package:xtrader_app/module/bottom_navigation/history/repository/history_api.dart';

import 'history_interface.dart';

class HistoryRepository implements IHistoryRepository {
  HistoryApi _historyApi = HistoryApi();
  @override
  Future fetchHistory({
    required String numberOfdays,
    required Function(HistoryData historyData) onSuccess,
  }) async {
    await _historyApi.fetchHistory(
      map: {'filter_days': numberOfdays},
      onSuccess: (Response response) {
        HistoryResponse result = HistoryResponse.fromJson(response.data);
        if (result.globalResponse?.code == 200 && result.data != null) {
          onSuccess(result.data!);
        } else {
          //throw Exception("Data is not available");
        }
      },
    ).catchError(
      (Object v) {
        throw Exception(v);
      },
    );
  }
}
