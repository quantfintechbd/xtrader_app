import 'package:flutter/material.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_details_response.dart';

import '../../../../bottom_navigation/quotes/model/quotes_details_response.dart';

@immutable
class ModifyOrderState {
  final TradeDetails? details;
  final Quotes? quotes;
  final TextEditingController slController, tpController, volumeController;
  final bool isValid;
  final List<Quotes> dataset;
  const ModifyOrderState({
    this.details,
    this.quotes,
    required this.slController,
    required this.tpController,
    required this.volumeController,
    required this.isValid,
    required this.dataset,
  });

  ModifyOrderState copyWith({
    TradeDetails? details,
    bool? isValid,
    Quotes? quotes,
    List<Quotes>? dataset,
  }) {
    return ModifyOrderState(
      details: details ?? this.details,
      tpController: this.tpController,
      slController: this.slController,
      volumeController: this.volumeController,
      isValid: isValid ?? this.isValid,
      quotes: quotes ?? this.quotes,
      dataset: dataset ?? this.dataset,
    );
  }
}
