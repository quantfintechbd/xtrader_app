import 'package:flutter/material.dart';
import 'package:xtrader_app/global/model/global_response.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_details_response.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_position_response.dart';

@immutable
abstract class ITradesRepository {
  Future fetchTradesPosition(
      {required Function(TradePositionData data) onsuccess});
  Future fetchDetails(
      {required String numberOfdays,
      required Function(List<TradeDetails> data) onSuccess});
  Future closeOrder({
    required String postion,
    required Function(GlobalResponse data) onSuccess,
  });
}
