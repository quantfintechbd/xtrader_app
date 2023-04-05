import 'package:flutter/material.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_details_response.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_position_response.dart';

@immutable
class TradesState {
  final Map<String, dynamic> tradePositionData;
  final List<TradeDetails>? tradeDetails;
  final bool positionLoading, detailsLoading;
  final String? currentSelction;
  const TradesState({
    required this.tradePositionData,
    this.tradeDetails,
    this.currentSelction,
    required this.detailsLoading,
    required this.positionLoading,
  });
  TradesState copyWith(
      {Map<String, dynamic>? tradePositionData,
      List<TradeDetails>? tradeDetails,
      bool? positionLoading,
      bool? detailsLoading,
      String? currentSelction}) {
    return TradesState(
      tradePositionData: tradePositionData ?? this.tradePositionData,
      tradeDetails: tradeDetails ?? this.tradeDetails,
      positionLoading: positionLoading ?? this.positionLoading,
      detailsLoading: detailsLoading ?? this.detailsLoading,
      currentSelction: currentSelction ?? this.currentSelction,
    );
  }
}
