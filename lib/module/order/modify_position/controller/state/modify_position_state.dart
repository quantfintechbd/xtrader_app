import 'package:flutter/material.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_details_response.dart';

@immutable
class ModifyOrderState {
  final TradeDetails? details;
  final TextEditingController slController, tpController;
  final bool isValid;
  const ModifyOrderState({
    this.details,
    required this.slController,
    required this.tpController,
    required this.isValid,
  });

  ModifyOrderState copyWith({TradeDetails? details, bool? isValid}) {
    return ModifyOrderState(
      details: details ?? this.details,
      tpController: this.tpController,
      slController: this.slController,
      isValid: isValid ?? this.isValid,
    );
  }
}
