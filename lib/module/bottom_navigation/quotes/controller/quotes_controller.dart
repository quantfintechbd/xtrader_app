import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtrader_app/data_provider/pref_helper.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/styles/k_colors.dart';

import '../../../../constant/constant_key.dart';
import '../model/quotes_details_response.dart';
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

  void startTimer() {
    loadData();
  }

  void stopTimer() {
    _quotesRepository.stopListening();
    state = state.copyWith(data: List.empty());
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
          });
    } else {
      state = state.copyWith(isSymbols: false, data: List.empty());
    }
  }

  QuotesColors getColor(Quotes item) {
    final lastsymbol = state.previousData
        ?.where((element) => element.symbol == item.symbol)
        .toList();

    if (lastsymbol == null || lastsymbol.isEmpty) {
      return QuotesColors(KColor.primary.color, KColor.primary.color);
    } else {
      Color askColor = lastsymbol.first.ask.toString().parseToDouble() >
                  item.ask.toString().parseToDouble() ==
              true
          ? KColor.red.color
          : KColor.primary.color;
      Color bidColor = lastsymbol.first.ask.toString().parseToDouble() >
                  item.bid.toString().parseToDouble() ==
              true
          ? KColor.red.color
          : KColor.primary.color;
      return QuotesColors(askColor, bidColor);
    }
  }

  void startListeningSocket() {
    _quotesRepository.socketData(onSuccess: (list) {
      final oldList = state.data;
      List<Quotes> newList = [];
      oldList?.forEach((element) {
        final incoming = list.where((item) => element.symbol == item.symbol);

        if (incoming.isNotEmpty) {
          final newQuotes = newList.add(element.quotesFrom(incoming.first));
        } else {
          newList.add(element);
        }
      });
      state =
          state.copyWith(isSymbols: true, data: newList, previousData: oldList);
    });
  }

  @override
  void dispose() {
    "dispose".log();

    super.dispose();
  }
}

class QuotesColors {
  final Color askColor, bidColor;

  QuotesColors(this.askColor, this.bidColor);
}
