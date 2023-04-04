import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/controller/state/trades_state.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../repository/trades_interface.dart';
import '../repository/trades_repository.dart';

final tradesProvider = StateNotifierProvider<TradesController, TradesState>(
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
}
