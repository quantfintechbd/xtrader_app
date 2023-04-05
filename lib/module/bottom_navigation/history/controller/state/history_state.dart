import 'package:flutter/material.dart';
import 'package:xtrader_app/module/bottom_navigation/history/model/history_response.dart';

@immutable
class HistoryState {
  final Map<String, dynamic> historySummery;
  final List<HistoryDetails> details;
  final String? currentSelction;
  final bool isLoading;

  const HistoryState({
    required this.historySummery,
    required this.isLoading,
    required this.details,
    this.currentSelction,
  });

  HistoryState copyWith({
    Map<String, dynamic>? historySummery,
    bool? isLoading,
    List<HistoryDetails>? details,
    String? currentSelction,
  }) {
    return HistoryState(
      isLoading: isLoading ?? this.isLoading,
      historySummery: historySummery ?? this.historySummery,
      details: details ?? this.details,
      currentSelction: currentSelction ?? this.currentSelction,
    );
  }
}
