import 'package:flutter/material.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_details_response.dart';

@immutable
class NewOrderState {
  final TradeDetails? details;
  final TextEditingController slController, tpController, priceController;
  final bool isValid;
  const NewOrderState({
    this.details,
    required this.slController,
    required this.tpController,
    required this.priceController,
    required this.isValid,
  });

  NewOrderState copyWith({TradeDetails? details, bool? isValid}) {
    return NewOrderState(
      details: details ?? this.details,
      tpController: this.tpController,
      slController: this.slController,
      priceController: this.priceController,
      isValid: isValid ?? this.isValid,
    );
  }
}
