import 'package:flutter/material.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_details_response.dart';

import '../../../../bottom_navigation/quotes/model/quotes_details_response.dart';

@immutable
class ModifyOrderState {
  final TradeDetails? details;
  final Quotes? quotes;
  final TextEditingController slController, tpController, volumeController;
  final bool isValid;
  const ModifyOrderState({
    this.details,
    this.quotes,
    required this.slController,
    required this.tpController,
    required this.volumeController,
    required this.isValid,
  });

  ModifyOrderState copyWith(
      {TradeDetails? details, bool? isValid, Quotes? quotes}) {
    return ModifyOrderState(
      details: details ?? this.details,
      tpController: this.tpController,
      slController: this.slController,
      volumeController: this.volumeController,
      isValid: isValid ?? this.isValid,
      quotes: quotes ?? this.quotes,
    );
  }
}
