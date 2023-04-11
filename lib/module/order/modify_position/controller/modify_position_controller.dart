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
  Timer? timer;
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
        isValid: state.slController.text.isNotEmpty &&
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

  bool shouldLoadData = true;
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      "Timer".log();
      if (state.quotes != null) {
        state.dataset.add(
          QuotesChartData(
            time: DateTime.now().microsecondsSinceEpoch.toDouble(),
            bid: state.quotes?.bid?.toString().parseToDouble() ?? 0.0,
            ask: state.quotes?.ask?.toString().parseToDouble() ?? 0.0,
          ),
        );
        state = state.copyWith(dataset: state.dataset);
      }
    });
    loadQuote();
    shouldLoadData = true;
  }

  void stopTimer() {
    timer?.cancel();
    timer = null;
    shouldLoadData = false;
  }

  Future loadQuote() async {
    await _modifypositionRepository.loadQuotes(
        symbols: {
          'selectedSymbols': [state.details?.symbol ?? '']
        },
        onSuccess: (value) {
          // state.dataset.add(value);
          state = state.copyWith(quotes: value);
          if (shouldLoadData) {
            Future.delayed(Duration(seconds: 3), () {
              loadQuote();
            });
          }
        });
  }
}
