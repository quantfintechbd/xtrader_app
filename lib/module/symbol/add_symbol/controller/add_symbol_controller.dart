import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtrader_app/data_provider/pref_helper.dart';
import 'package:xtrader_app/module/symbol/add_symbol/controller/state/add_symbol_state.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../repository/add_symbol_interface.dart';
import '../repository/add_symbol_repository.dart';

final addSymbolProvider =
    StateNotifierProvider<AddSymbolController, AddSymbolState>(
        (ref) => AddSymbolController());

class AddSymbolController extends StateNotifier<AddSymbolState> {
  final IAddSymbolRepository _addsymbolRepository = AddSymbolRepository();

  AddSymbolController()
      : super(
          AddSymbolState(
              remoteSymbols: [],
              localSymbols: [],
              unAttended: [],
              searchController: TextEditingController()),
        ) {
    fetchRemote();
    fetchLocal();
    state.searchController.addListener(() {
      List<String> data = state.remoteSymbols
          .toList()
          .where((element) =>
              state.localSymbols.toList().contains(element) == false &&
              element
                  .toUpperCase()
                  .contains(state.searchController.text.toUpperCase()))
          .toList();
      state = state.copyWith(unAttended: data);
    });
  }
  void fetchRemote() async {
    final List<String> remote = await _addsymbolRepository.fetchRemoteSymbols();

    state = state.copyWith(
      remoteSymbols: remote,
    );
  }

  void fetchLocal() async {
    final List<String> local = await _addsymbolRepository.fetchLocalSymbols();
    local.length.log();
    state = state.copyWith(
      localSymbols: local,
    );
  }

  void makeUnAttendedData() {
    // List<String> data = state.remoteSymbols
    //     .toList()
    //     .where(
    //         (element) => state.localSymbols.toList().contains(element) == false)
    //     .toList();
    // state = state.copyWith(unAttended: data);
    List<String> data = state.remoteSymbols
        .toList()
        .where((element) =>
            state.localSymbols.toList().contains(element) == false &&
            element
                .toUpperCase()
                .contains(state.searchController.text.toUpperCase()))
        .toList();
    state = state.copyWith(unAttended: data);
  }

  void addLocal(String symbol) {
    state.localSymbols.add(symbol);
    _addsymbolRepository.updateLocal(state.localSymbols);
    makeUnAttendedData();
  }
}
