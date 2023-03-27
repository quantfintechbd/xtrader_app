import 'package:flutter/material.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/module/bottom_navigation/charts/views/charts_screen.dart';
import 'package:xtrader_app/module/bottom_navigation/history/views/history_screen.dart';
import 'package:xtrader_app/module/bottom_navigation/home/views/home_screen.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/views/quotes_screen.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/views/trades_screen.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/styles/k_assets.dart';
import 'package:xtrader_app/utils/styles/k_colors.dart';

@immutable
class BottomNavigationState {
  final int selectedTab;
  List<BottomNavigationBarItem> barItems = [
    BottomNavigationBarItem(
      label: 'Quotes',
      icon: GlobalSvgLoader(
        imagePath: KAssetName.quotesActive.imagePath,
        svgFor: SvgFor.asset,
        color: KColor.white.color,
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
        imagePath: KAssetName.chartsInactive.imagePath,
        svgFor: SvgFor.asset,
        color: KColor.primary.color,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Trades',
      icon: GlobalSvgLoader(
        imagePath: KAssetName.tradeInactive.imagePath,
        svgFor: SvgFor.asset,
      ),
      activeIcon: GlobalSvgLoader(
        imagePath: KAssetName.tradeInactive.imagePath,
        svgFor: SvgFor.asset,
        color: KColor.primary.color,
      ),
    ),
    BottomNavigationBarItem(
      label: 'History',
      icon: GlobalSvgLoader(
        imagePath: KAssetName.historyInactive.imagePath,
        svgFor: SvgFor.asset,
      ),
      activeIcon: GlobalSvgLoader(
        imagePath: KAssetName.historyInactive.imagePath,
        svgFor: SvgFor.asset,
        color: KColor.primary.color,
      ),
    ),
  ];

  final List<Widget> screens = [
    QuotesScreen(),
    ChartsScreen(),
    TradesScreen(),
    HistoryScreen(),
  ];

  BottomNavigationState({required this.selectedTab});

  BottomNavigationState copyWith({int? selectedTab}) {
    return BottomNavigationState(
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }
}
