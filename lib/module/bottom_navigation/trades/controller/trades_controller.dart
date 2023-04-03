import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/controller/state/trades_state.dart';

import '../repository/trades_interface.dart';
import '../repository/trades_repository.dart';

final tradesProvider = StateNotifierProvider<TradesController, TradesState>(
    (ref) => TradesController());

class TradesController extends StateNotifier<TradesState> {
  final ITradesRepository _tradesRepository = TradesRepository();

  TradesController() : super(TradesState(tradePositionData: {})) {
    fetchTradesPostion();
  }

  void fetchTradesPostion() async {
    await _tradesRepository.fetchTradesPosition(onsuccess: (data) {
      state = state.copyWith(tradePositionData: data.toJson());
    });
  }
}
