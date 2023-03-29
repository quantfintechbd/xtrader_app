import 'package:flutter/material.dart';
import 'package:xtrader_app/global/widget/global_appbar.dart';
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

  BottomNavigationState({required this.selectedTab});

  BottomNavigationState copyWith({int? selectedTab}) {
    return BottomNavigationState(
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }

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
