import 'package:flutter/material.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_details_response.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_position_response.dart';

@immutable
class TradesState {
  final Map<String, dynamic> tradePositionData;
  final List<TradeDetails>? tradeDetails;
  final bool positionLoading, detailsLoading;

  const TradesState({
    required this.tradePositionData,
    this.tradeDetails,
    required this.detailsLoading,
    required this.positionLoading,
  });
  TradesState copyWith({
    Map<String, dynamic>? tradePositionData,
    List<TradeDetails>? tradeDetails,
    bool? positionLoading,
    bool? detailsLoading,
  }) {
    return TradesState(
      tradePositionData: tradePositionData ?? this.tradePositionData,
      tradeDetails: tradeDetails ?? this.tradeDetails,
      positionLoading: positionLoading ?? this.positionLoading,
      detailsLoading: detailsLoading ?? this.detailsLoading,
    );
  }
}
