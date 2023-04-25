import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtrader_app/data_provider/pref_helper.dart';
import 'package:xtrader_app/module/symbol/add_symbol/controller/state/add_symbol_state.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../../../../constant/constant_key.dart';
import '../../load_symbol/repository/load_symbol_interface.dart';
import '../../load_symbol/repository/load_symbol_repository.dart';
import '../repository/add_symbol_interface.dart';
import '../repository/add_symbol_repository.dart';

final addSymbolProvider =
    StateNotifierProvider<AddSymbolController, AddSymbolState>(
        (ref) => AddSymbolController());

class AddSymbolController extends StateNotifier<AddSymbolState> {
  final IAddSymbolRepository _addsymbolRepository = AddSymbolRepository();
  final ILoadSymbolRepository _loadsymbolRepository = LoadSymbolRepository();
  AddSymbolController()
      : super(
          AddSymbolState(
            remoteSymbols: [],
            localSymbols: [],
            unAttended: [],
            searchController: TextEditingController(),
            totalCount: 0,
            startIndex: 0,
            endIndex: 10,
            isLoading: false,
          ),
        ) {
    getTotalSymbolCount();
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
    "remote ${remote.length}".log();
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
    makeUnAttendedData();
  }

  void makeUnAttendedData() {
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

  void getTotalSymbolCount() {
    _loadsymbolRepository.getTotalCount(onsuccess: (totalData) {
      state = state.copyWith(totalCount: int.parse(totalData.total ?? "0"));
      final List<String> saved =
          PrefHelper.getStringList(AppConstant.REMOTE_SYMBOLS.key);
      if (saved.length != state.totalCount) {
        PrefHelper.setStringList(AppConstant.REMOTE_SYMBOLS.key, []);
        fetchSymbols();
      } else {
        fetchRemote();
        fetchLocal();
      }
    });
  }

  int apiCount = 0;
  int responseCount = 0;
  void fetchSymbols() async {
    apiCount++;
    state = state.copyWith(isLoading: true);
    _loadsymbolRepository.loadSymbols(
        map: {
          'start': state.startIndex,
          'end': state.endIndex,
          'total': state.totalCount
        },
        onsuccess: (data) async {
          responseCount++;
          for (var element in data) {
            if (state.remoteSymbols.contains(element) == false) {
              state.remoteSymbols.add(element);
            }
          }
          if (state.remoteSymbols.length <= state.totalCount - 1) {
            final newEndindex = state.endIndex + state.limit + 1;

            state = state.copyWith(
              startIndex: state.endIndex + 1,
              endIndex: newEndindex <= state.totalCount - 1
                  ? state.endIndex + state.limit + 1
                  : state.totalCount - 1,
            );
            "State".log();
            state.remoteSymbols.length.log();
            state.startIndex.log();
            state.endIndex.log();
            fetchSymbols();
          } else {
            if (apiCount == responseCount) {
              state.remoteSymbols.length.log();
              PrefHelper.setStringList(
                  AppConstant.REMOTE_SYMBOLS.key, state.remoteSymbols);
              state = state.copyWith(
                remoteSymbols: state.remoteSymbols,
              );
              fetchLocal();
              state = state.copyWith(isLoading: false);
            }
          }
        });
  }
}
