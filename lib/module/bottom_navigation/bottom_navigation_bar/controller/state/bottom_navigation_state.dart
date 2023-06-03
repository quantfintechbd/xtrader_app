import 'package:flutter/material.dart';
import 'package:xtrader_app/global/widget/global_app_bar/global_appbar.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/module/bottom_navigation/charts/views/charts_screen.dart';
import 'package:xtrader_app/module/bottom_navigation/history/views/history_screen.dart';

import 'package:xtrader_app/module/bottom_navigation/quotes/views/quotes_screen.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/views/trades_screen.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/styles/k_assets.dart';
import 'package:xtrader_app/utils/styles/k_colors.dart';

@immutable
class BottomNavigationState {
  final int selectedTab;
  final String dropdownvalue;
  final String historyFilterValue;
  final String? selectedSymbol;
  final Color? appbarBg;
  final Widget? appBarTitleWidget;
  BottomNavigationState({
    required this.selectedTab,
    required this.dropdownvalue,
    required this.historyFilterValue,
    this.selectedSymbol,
    this.appbarBg,
    this.appBarTitleWidget,
  });

  BottomNavigationState copyWith({
    int? selectedTab,
    String? dropdownvalue,
    String? historyFilterValue,
    String? selectedSymbol,
    Color? appbarBg,
    Widget? appBarTitleWidget,
  }) {
    return BottomNavigationState(
      selectedTab: selectedTab ?? this.selectedTab,
      dropdownvalue: dropdownvalue ?? this.dropdownvalue,
      historyFilterValue: historyFilterValue ?? this.historyFilterValue,
      selectedSymbol: selectedSymbol ?? this.selectedSymbol,
      appbarBg: appbarBg ?? this.appbarBg,
      appBarTitleWidget: appBarTitleWidget ?? this.appBarTitleWidget,
    );
  }

  var items = [
    'Today',
    '7 Days',
    '15 Days',
    '1 Month',
    '1 year',
  ];
  List<BottomNavigationBarItem> barItems = [
    BottomNavigationBarItem(
      label: 'Quotes',
      icon: GlobalSvgLoader(
        imagePath: KAssetName.quotesInactive.imagePath,
        svgFor: SvgFor.asset,
      ),
      activeIcon: GlobalSvgLoader(
        imagePath: KAssetName.quotesActive.imagePath,
        svgFor: SvgFor.asset,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Charts',
      icon: GlobalSvgLoader(
        imagePath: KAssetName.chartsInactive.imagePath,
        svgFor: SvgFor.asset,
      ),
      activeIcon: GlobalSvgLoader(
        imagePath: KAssetName.chartsActive.imagePath,
        svgFor: SvgFor.asset,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Trades',
      icon: GlobalSvgLoader(
        imagePath: KAssetName.tradeInactive.imagePath,
        svgFor: SvgFor.asset,
      ),
      activeIcon: GlobalSvgLoader(
        imagePath: KAssetName.tradeActive.imagePath,
        svgFor: SvgFor.asset,
      ),
    ),
    BottomNavigationBarItem(
      label: 'History',
      icon: GlobalSvgLoader(
        imagePath: KAssetName.historyInactive.imagePath,
        svgFor: SvgFor.asset,
      ),
      activeIcon: GlobalSvgLoader(
        imagePath: KAssetName.historyActive.imagePath,
        svgFor: SvgFor.asset,
      ),
    ),
  ];

  final List<Widget> screens = [
    QuotesScreen(),
    ChartsScreen(),
    TradesScreen(),
    HistoryScreen(),
  ];
}
