import 'package:flutter/material.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_position_response.dart';

@immutable
class TradesState {
  final Map<String, dynamic> tradePositionData;

  TradesState({required this.tradePositionData});
  TradesState copyWith({Map<String, dynamic>? tradePositionData}) {
    return TradesState(
        tradePositionData: tradePositionData ?? this.tradePositionData);
  }
}
