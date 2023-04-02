import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtrader_app/constant/constant_key.dart';
import 'package:xtrader_app/data_provider/pref_helper.dart';
import 'package:xtrader_app/utils/app_routes.dart';
import 'package:xtrader_app/utils/app_version.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/navigation.dart';

import '../repository/load_symbol_interface.dart';
import '../repository/load_symbol_repository.dart';
import 'state/load_symbol_state.dart';

final loadSymbolProvider =
    StateNotifierProvider<LoadSymbolController, LoadSymbolState>(
        (ref) => LoadSymbolController());

class LoadSymbolController extends StateNotifier<LoadSymbolState> {
  final ILoadSymbolRepository _loadsymbolRepository = LoadSymbolRepository();

  LoadSymbolController()
      : super(LoadSymbolState(
            totalCount: 0, startIndex: 0, endIndex: 5, remoteSymbols: []));

  void getTotalSymbolCount(BuildContext context) {
    _loadsymbolRepository.getTotalCount(onsuccess: (totalData) {
      state = state.copyWith(totalCount: int.parse(totalData.total ?? "0"));
      final List<String> saved =
          PrefHelper.getStringList(AppConstant.REMOTE_SYMBOLS.key);
      if (saved.length != state.totalCount) {
        PrefHelper.setStringList(AppConstant.REMOTE_SYMBOLS.key, []);
        fetchSymbols(context);
      } else {
        Navigation.pushAndRemoveUntil(
          context,
          appRoutes: AppRoutes.bottomNavigation,
        );
      }
    });
  }

  int apiCount = 0;
  int responseCount = 0;
  void fetchSymbols(BuildContext context) {
    apiCount++;
    _loadsymbolRepository.loadSymbols(
        map: {
          'start': state.startIndex,
          'end': state.endIndex,
          'total': state.totalCount
        },
        onsuccess: (data) {
          responseCount++;
          for (var element in data) {
            if (state.remoteSymbols.contains(element) == false) {
              state.remoteSymbols.add(element);
            }
          }
          if (state.remoteSymbols.length != state.totalCount) {
            state = state.copyWith(
              startIndex: state.endIndex + 1,
              endIndex: state.endIndex + 6,
            );
            "State".log();
            state.remoteSymbols.length.log();
            state.startIndex.log();
            state.endIndex.log();
            fetchSymbols(context);
          } else {
            "calling Done".log();
            if (apiCount == responseCount) {
              "response Done".log();
              state.remoteSymbols.length.log();
              PrefHelper.setStringList(
                  AppConstant.REMOTE_SYMBOLS.key, state.remoteSymbols);
              Navigation.pushAndRemoveUntil(
                context,
                appRoutes: AppRoutes.bottomNavigation,
              );
            }
          }
        });
  }
}
