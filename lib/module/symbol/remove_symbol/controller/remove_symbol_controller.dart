import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtrader_app/module/symbol/remove_symbol/controller/state/remove_symbol_state.dart';

import '../repository/remove_symbol_interface.dart';
import '../repository/remove_symbol_repository.dart';

final removeSymbolProvider =
    StateNotifierProvider<RemoveSymbolController, RemoveSymbolState>(
  (ref) => RemoveSymbolController(),
);

class RemoveSymbolController extends StateNotifier<RemoveSymbolState> {
  final IRemoveSymbolRepository _removesymbolRepository =
      RemoveSymbolRepository();

  RemoveSymbolController()
      : super(
          RemoveSymbolState(
            filtered: const [],
            localSymbols: const [],
            searchController: TextEditingController(),
          ),
        ) {
    loadLocalSymbols();
    state.searchController.addListener(() {
      filterSymbols();
    });
  }
  void loadLocalSymbols() async {
    final local = await _removesymbolRepository.fetchLocalSymbols();
    state = state.copyWith(localSymbols: local);
  }

  void filterSymbols() {
    final filtered = state.localSymbols
        .where((element) => element
            .toUpperCase()
            .contains(state.searchController.text.toUpperCase()))
        .toList();
    state = state.copyWith(filtered: filtered);
  }

  void removeSymbol(String symbol) {
    state.localSymbols.remove(symbol);
    _removesymbolRepository.updateLocal(state.localSymbols);
    filterSymbols();
  }
}
