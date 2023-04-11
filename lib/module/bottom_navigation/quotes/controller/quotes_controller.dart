import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtrader_app/data_provider/pref_helper.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../../../../constant/constant_key.dart';
import '../repository/quotes_interface.dart';
import '../repository/quotes_repository.dart';
import 'state/quotes_state.dart';

final quotesProvider =
    StateNotifierProvider.autoDispose<QuotesController, QuotesState>(
  (ref) => QuotesController(),
);

class QuotesController extends StateNotifier<QuotesState> {
  final IQuotesRepository _quotesRepository = QuotesRepository();

  QuotesController()
      : super(
          const QuotesState(isSymbols: true),
        );

  bool shouldLoadData = true;
  void startTimer() {
    loadData();
    shouldLoadData = true;
  }

  void stopTimer() {
    state = state.copyWith(data: List.empty());
    shouldLoadData = false;
  }

  Future loadData() async {
    final List<String> symbols =
        PrefHelper.getStringList(AppConstant.LOCAL_SYMBOLS.key);
    if (symbols.isNotEmpty) {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['selectedSymbols'] = symbols.map((v) => v).toList();
      data.log();
      _quotesRepository.loadQuotes(
          symbols: data,
          onSuccess: (listData) {
            final oldData = state.data;
            state = state.copyWith(
                isSymbols: true, data: listData, previousData: oldData);
            Future.delayed(const Duration(seconds: 5), () {
              if (shouldLoadData) {
                loadData();
              }
            });
          });
    } else {
      state = state.copyWith(isSymbols: false, data: List.empty());
    }
  }

  @override
  void dispose() {
    "dispose".log();

    super.dispose();
  }
}
