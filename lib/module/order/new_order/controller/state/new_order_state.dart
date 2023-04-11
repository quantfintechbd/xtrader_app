import 'package:flutter/material.dart';

import '../../../../bottom_navigation/quotes/model/quotes_details_response.dart';

@immutable
class NewOrderState {
  String? symbol;
  final Quotes? quotes;
  final TextEditingController slController,
      tpController,
      priceController,
      orderSize;
  final bool isValid;
  final String? dropdownvalue;
  final List<Quotes> dataset;

  NewOrderState({
    this.symbol,
    this.quotes,
    required this.slController,
    required this.tpController,
    required this.priceController,
    required this.orderSize,
    required this.isValid,
    this.dropdownvalue,
    required this.dataset,
  });

  final items = [
    "Instant Execution",
    "Buy Limit",
    "Sell Limit",
    "Buy Stop",
    "Sell Stop"
  ];
  NewOrderState copyWith(
      {String? symbol,
      bool? isValid,
      String? dropdownvalue,
      Quotes? quotes,
      List<Quotes>? dataset}) {
    return NewOrderState(
      symbol: symbol ?? this.symbol,
      quotes: quotes ?? this.quotes,
      tpController: this.tpController,
      slController: this.slController,
      priceController: this.priceController,
      orderSize: this.orderSize,
      isValid: isValid ?? this.isValid,
      dropdownvalue: dropdownvalue ?? this.dropdownvalue,
      dataset: dataset ?? this.dataset,
    );
  }
}
