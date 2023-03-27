import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/bottom_navigation_interface.dart';
import '../repository/bottom_navigation_repository.dart';
import 'state/bottom_navigation_state.dart';

final bottomNavigationProvider =
    StateNotifierProvider<BottomNavigationController, BottomNavigationState>(
        (ref) => BottomNavigationController());

class BottomNavigationController extends StateNotifier<BottomNavigationState> {
  final IBottomNavigationRepository _bottomnavigationRepository =
      BottomNavigationRepository();

  BottomNavigationController() : super(BottomNavigationState(selectedTab: 0));

  void changeTap(int value) {
    state = state.copyWith(selectedTab: value);
  }

  Widget get screen {
    return state.screens[state.selectedTab];
  }
}
