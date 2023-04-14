import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/error_dialog.dart';
import 'package:xtrader_app/module/bottom_navigation/bottom_navigation_bar/controller/bottom_navigation_controller.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/model/quotes_details_response.dart';
import 'package:xtrader_app/module/order/new_order/controller/state/new_order_state.dart';
import 'package:xtrader_app/module/order/new_order/model/new_order_request.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/navigation.dart';
import 'package:xtrader_app/utils/styles/k_colors.dart';
import 'package:xtrader_app/utils/view_util.dart';

import '../repository/new_order_interface.dart';
import '../repository/new_order_repository.dart';

final newOrderProvider =
    StateNotifierProvider.autoDispose<NewOrderController, NewOrderState>(
  (ref) => NewOrderController(),
);

class NewOrderController extends StateNotifier<NewOrderState> {
  final INewOrderRepository _neworderRepository = NewOrderRepository();
  NewOrderController()
      : super(
          NewOrderState(
            slController: TextEditingController(),
            tpController: TextEditingController(),
            priceController: TextEditingController(),
            orderSize: TextEditingController(),
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
    state.priceController.addListener(() {
      validate();
    });
    state.orderSize.addListener(() {
      validate();
    });
  }
  void setdetails(String details) {
    state = state.copyWith(symbol: details, dropdownvalue: 'Instant Execution');
  }

  void stopTimer() {
    _neworderRepository.stopListening();
  }

  void validate() {
    if (state.dropdownvalue != null &&
        state.orderSize.text.isNotEmpty == true) {
      state = state.copyWith(isValid: true);
      if (state.dropdownvalue == 'Instant Execution') {
        state = state.copyWith(isValid: true);
      } else if (state.priceController.text.isNotEmpty &&
          state.priceController.text.parseToDouble() > 0.0) {
        state = state.copyWith(isValid: true);
      } else {
        state = state.copyWith(isValid: false);
      }
    } else {
      state = state.copyWith(isValid: false);
    }
  }

  void onchanged(String value) {
    state = state.copyWith(dropdownvalue: value);
    validate();
  }

  Future newOrder(BuildContext context, {required String action}) async {
    NewOrderRequest request = NewOrderRequest(
        buySell: action,
        symbol: state.symbol,
        orderSize: state.orderSize.text,
        price: state.priceController.text,
        orderExecutionType: state.dropdownvalue,
        slValue: state.slController.text,
        tpValue: state.tpController.text);
    _neworderRepository
        .requestNewOrder(
            data: request,
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
                  titleColor: KColor.primary.color,
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

  Future loadQuote() async {
    await _neworderRepository.loadQuotes(
        symbols: {
          'selectedSymbols': [state.symbol ?? '']
        },
        onSuccess: (value) {
          state = state.copyWith(quotes: value);
        });
  }

  void startListening() {
    _neworderRepository.socketData(
        symbol: state.symbol ?? '',
        onSuccess: (data) {
          data.log();
          state.dataset.add(
            QuotesChartData(
              bid: data.bid.toString().parseToDouble(),
              ask: data.ask.toString().parseToDouble(),
              time: data.time.toString().parseToDouble(),
            ),
          );
          state = state.copyWith(
              quotes: state.quotes?.quotesFrom(data), dataset: state.dataset);
        });
  }
}
