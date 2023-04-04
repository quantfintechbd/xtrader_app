import 'package:flutter/material.dart';
import 'package:xtrader_app/module/bottom_navigation/history/model/history_response.dart';

@immutable
abstract class IHistoryRepository {
  Future fetchHistory(
      {required String numberOfdays, required Function(HistoryData) onSuccess});
}
