import 'package:flutter/material.dart';

import '../../model/quotes_details_response.dart';

@immutable
class QuotesState {
  final List<Quotes>? data;
  final bool isSymbols;

  const QuotesState({this.data, required this.isSymbols});

  QuotesState copyWith({List<Quotes>? data, bool? isSymbols}) {
    return QuotesState(
      data: data ?? this.data,
      isSymbols: isSymbols ?? this.isSymbols,
    );
  }
}
