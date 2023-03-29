import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtrader_app/utils/theme/theme_util.dart';

final themeProvider = StateNotifierProvider<ThemeController, ThemeState>(
    (ref) => ThemeController());

class ThemeController extends StateNotifier<ThemeState> {
  ThemeController() : super(ThemeState(theme: ThemeUtil.appTheme));
  void setTheme(XtraderTheme theme) {
    state = state.copyWith(theme);
  }
}

@immutable
class ThemeState {
  final XtraderTheme theme;

  const ThemeState({required this.theme});

  ThemeState copyWith(XtraderTheme theme) {
    ThemeUtil.appTheme = theme;
    return ThemeState(theme: theme);
  }
}
