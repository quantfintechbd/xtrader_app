import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtrader_app/global/widget/global_appbar.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/utils/app_routes.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/navigation.dart';
import 'package:xtrader_app/utils/styles/k_assets.dart';

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

  GlobalAppbar getAppBar(BuildContext context) {
    switch (state.selectedTab) {
      case 0:
        return GlobalAppbar(
          isShowMenubar: true,
          title: "Quotes",
          isToShowElevation: true,
          actions: [
            GestureDetector(
              onTap: () {
                Navigation.push(context, appRoutes: AppRoutes.addSymbol);
              },
              child: Padding(
                padding: EdgeInsets.all(10),
                child: GlobalSvgLoader(
                  imagePath: KAssetName.add.imagePath,
                  svgFor: SvgFor.asset,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigation.push(context, appRoutes: AppRoutes.removeSymbol);
              },
              child: Padding(
                padding: EdgeInsets.all(10),
                child: GlobalSvgLoader(
                  imagePath: KAssetName.edit.imagePath,
                  svgFor: SvgFor.asset,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        );
      case 2:
        return GlobalAppbar(
          isShowMenubar: true,
          title: "Trade  +5780.557 USD",
        );
      default:
        return GlobalAppbar(
          isShowMenubar: true,
        );
    }
  }
}
