import 'package:dio/dio.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_position_response.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/repository/trades_api.dart';
import 'package:xtrader_app/utils/extension.dart';

import 'trades_interface.dart';

class TradesRepository implements ITradesRepository {
  final TradesApi _tradesApi = TradesApi();
  @override
  Future fetchTradesPosition(
      {required Function(TradePositionData data) onsuccess}) async {
    await _tradesApi.fetchTradePostion(
      onSuccess: (Response response) {
        TradePositionResponse result =
            TradePositionResponse.fromJson(response.data);
        if (result.globalResponse?.code == 200 && result.data != null) {
          onsuccess(result.data!);
        } else {
          //throw Exception("Data is not available");
        }
      },
    ).catchError((error, stackTrace) {
      "repo : $error".log();
      throw Exception(error);
    });
  }
}
