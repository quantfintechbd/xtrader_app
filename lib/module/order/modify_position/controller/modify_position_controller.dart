import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/model/quotes_details_response.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_details_response.dart';
import 'package:xtrader_app/module/order/modify_position/controller/state/modify_position_state.dart';
import 'package:xtrader_app/module/order/modify_position/model/modify_request.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/view_util.dart';

import '../../../../global/widget/error_dialog.dart';
import '../../../../utils/navigation.dart';
import '../repository/modify_position_interface.dart';
import '../repository/modify_position_repository.dart';

final modifyPostionProvider = StateNotifierProvider.autoDispose<
    ModifyPositionController,
    ModifyOrderState>((ref) => ModifyPositionController());

class ModifyPositionController extends StateNotifier<ModifyOrderState> {
  final IModifyPositionRepository _modifypositionRepository =
      ModifyPositionRepository();

  ModifyPositionController()
      : super(
          ModifyOrderState(
            slController: TextEditingController(),
            tpController: TextEditingController(),
            volumeController: TextEditingController(),
            isValid: false,
            dataset: [],
          ),
        ) {
    state.slController.addListener(
      () {
        validate();
      },
    );
    state.tpController.addListener(
      () {
        validate();
      },
    );
  }
  void setdetails(TradeDetails details) {
    state = state.copyWith(details: details);
    state.volumeController.text =
        details.volume.toString().parseToDouble().toString();
    loadQuote();
  }

  void validate() {
    state = state.copyWith(
        isValid: state.slController.text.isNotEmpty ||
            state.tpController.text.isNotEmpty);
  }

  Future modifyResponse(BuildContext context) async {
    if (state.isValid) {
      final data = ModifyOrderRequest(
        symbol: state.details?.symbol,
        position: state.details?.position,
        tpValue: state.tpController.text.parseToDouble(),
        slValue: state.slController.text.parseToDouble(),
      );

      _modifypositionRepository
          .requestModifyResponse(
              data: data,
              onSuccess: (data) {
                Navigation.pop(context);
                ViewUtil.showAlertDialog(
                  barrierDismissible: false,
                  contentPadding: EdgeInsets.zero,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.r),
                  ),
                  content: ErrorDialog(
                    erroMsg: data.globalResponse?.message ?? '',
                    title: "Success!",
                    callbackAction: (_) {
                      Navigation.pop(context);
                    },
                  ),
                );
              })
          .catchError((_) {
        Navigation.pop(context);
      });
    }
  }

  void stopTimer() {
    _modifypositionRepository.stopListening();
  }

  Future loadQuote() async {
    await _modifypositionRepository.loadQuotes(
        symbols: {
          'selectedSymbols': [state.details?.symbol ?? '']
        },
        onSuccess: (value) {
          // state.dataset.add(value);
          state = state.copyWith(quotes: value);
        });
  }

  void startListening() {
    _modifypositionRepository.socketData(
        symbol: state.details?.symbol ?? '',
        onSuccess: (data) {
          if (mounted) {
            state.dataset.add(
              QuotesChartData(
                bid: data.bid.toString().parseToDouble(),
                ask: data.ask.toString().parseToDouble(),
                time: data.time.toString().parseToDouble(),
              ),
            );
            state = state.copyWith(
                quotes: state.quotes?.quotesFrom(data), dataset: state.dataset);
          }
        });
  }
}
