import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_loader.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/controller/state/trades_state.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/navigation.dart';
import 'package:xtrader_app/utils/view_util.dart';

import '../../../../global/widget/error_dialog.dart';
import '../repository/trades_interface.dart';
import '../repository/trades_repository.dart';

final tradesProvider =
    StateNotifierProvider.autoDispose<TradesController, TradesState>(
        (ref) => TradesController());

class TradesController extends StateNotifier<TradesState> {
  final ITradesRepository _tradesRepository = TradesRepository();

  TradesController()
      : super(const TradesState(
          tradePositionData: {},
          positionLoading: false,
          detailsLoading: false,
        )) {
    fetchTradesPostion();
    fetchTradeDetails('7 Days');
  }

  void refresh() {
    fetchTradesPostion();
    fetchTradeDetails(state.currentSelction ?? '7 Days');
  }

  void fetchTradesPostion() async {
    state = state.copyWith(positionLoading: true);
    await _tradesRepository.fetchTradesPosition(
      onsuccess: (data) {
        state = state.copyWith(
          tradePositionData: data.toJson(),
          positionLoading: false,
        );
      },
    ).catchError((_) {
      state = state.copyWith(positionLoading: false);
    });
  }

  void fetchTradeDetails(String selection) async {
    selection.log();
    int days = 0;
    state = state.copyWith(currentSelction: selection);
    switch (selection) {
      case '7 Days':
        days = 7;
        break;
      case '15 Days':
        days = 15;
        break;
      case '1 Month':
        days = 30;
        break;
      case '1 year':
        days = 365;
        break;
      default:
        days = 7;
        break;
    }

    state = state.copyWith(detailsLoading: true);
    await _tradesRepository
        .fetchDetails(
      numberOfdays: days.toString(),
      onSuccess: (listData) {
        state = state.copyWith(
          tradeDetails: listData,
          detailsLoading: false,
        );
      },
    )
        .catchError((_) {
      state = state.copyWith(detailsLoading: false);
    });
  }

  Future closeOrder(String position, BuildContext context) async {
    ViewUtil.showAlertDialog(
      content: const GlobalLoader(),
    );
    _tradesRepository
        .closeOrder(
            postion: position,
            onSuccess: (data) {
              refresh();
              Navigation.pop(context);
              ViewUtil.showAlertDialog(
                barrierDismissible: false,
                contentPadding: EdgeInsets.zero,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.r),
                ),
                content: ErrorDialog(
                  erroMsg: data.message ?? '',
                  title: "Success!",
                ),
              );
            })
        .catchError((Object v) {
      Navigation.pop(context);
    });
  }
}
