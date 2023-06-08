import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtrader_app/module/bottom_navigation/history/controller/state/history_state.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../repository/history_interface.dart';
import '../repository/history_repository.dart';

final historyProvider =
    StateNotifierProvider.autoDispose<HistoryController, HistoryState>(
  (ref) => HistoryController(),
);

class HistoryController extends StateNotifier<HistoryState> {
  final IHistoryRepository _historyRepository = HistoryRepository();

  HistoryController()
      : super(
          const HistoryState(
            isLoading: false,
            historySummery: {},
            details: [],
          ),
        ) {
    fetchHistory('Today');
  }
  Future<void> refresh() async {
    fetchHistory(state.currentSelction ?? 'Today');
  }

  void fetchHistory(String selection) async {
    selection.log();
    int days = 0;
    state = state.copyWith(currentSelction: selection);
    switch (selection) {
      case 'Today':
        days = 1;
        break;
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
    state = state.copyWith(isLoading: true);
    await _historyRepository
        .fetchHistory(
      numberOfdays: days.toString(),
      onSuccess: (historyData) {
        if (historyData.summery != null) {
          state = state.copyWith(
            historySummery: historyData.summery!.toJson(),
          );
        }
        if (historyData.details != null) {
          state = state.copyWith(
            details: historyData.details,
          );
        }
        state = state.copyWith(
          isLoading: false,
        );
      },
    )
        .catchError((_) {
      state = state.copyWith(isLoading: false);
    });
  }
}
