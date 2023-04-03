import 'package:flutter/material.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_position_response.dart';

@immutable
abstract class ITradesRepository {
  Future fetchTradesPosition(
      {required Function(TradePositionData data) onsuccess});
}
