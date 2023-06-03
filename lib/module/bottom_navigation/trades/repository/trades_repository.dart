import 'package:dio/dio.dart';
import 'package:xtrader_app/global/model/global_response.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_details_response.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_position_response.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/repository/trades_api.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../model/close_order_request.dart';
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

  @override
  Future fetchDetails(
      {required String numberOfdays,
      required Function(List<TradeDetails> data) onSuccess}) async {
    await _tradesApi.fetchDetails(
        map: {'filter_days': numberOfdays},
        onSuccess: (Response response) {
          TradeDetailsResponse result =
              TradeDetailsResponse.fromJson(response.data);
          if (result.globalResponse?.code == 200 && result.data != null) {
            onSuccess(result.data!);
          } else {
            //throw Exception("Data is not available");
          }
        }).catchError((Object v) {
      throw Exception(v);
    });
  }

  @override
  Future closeOrder({
    required CloseOrderRequest requestModel,
    required Function(GlobalResponse data) onSuccess,
  }) async {
    await _tradesApi.closeOrder(
        map: requestModel.toMap(),
        onSuccess: (Response response) {
          GlobalResponse result = GlobalResponse.fromJson(response.data);

          onSuccess(result);
        });
  }
}
