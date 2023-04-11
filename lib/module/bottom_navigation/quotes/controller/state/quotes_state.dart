import 'package:flutter/material.dart';

import '../../model/quotes_details_response.dart';

@immutable
class QuotesState {
  final List<Quotes>? data, previousData;
  final bool isSymbols;

  const QuotesState({this.data, this.previousData, required this.isSymbols});

  QuotesState copyWith(
      {List<Quotes>? data, List<Quotes>? previousData, bool? isSymbols}) {
    return QuotesState(
      data: data ?? this.data,
      previousData: previousData ?? this.previousData,
      isSymbols: isSymbols ?? this.isSymbols,
    );
  }
}
