import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_appbar.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/module/bottom_navigation/history/controller/history_controller.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/controller/trades_controller.dart';
import 'package:xtrader_app/utils/app_routes.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/navigation.dart';
import 'package:xtrader_app/utils/styles/k_assets.dart';
import 'package:xtrader_app/utils/styles/k_colors.dart';

import '../repository/bottom_navigation_interface.dart';
import '../repository/bottom_navigation_repository.dart';
import 'state/bottom_navigation_state.dart';

final bottomNavigationProvider =
    StateNotifierProvider<BottomNavigationController, BottomNavigationState>(
        (ref) => BottomNavigationController());

class BottomNavigationController extends StateNotifier<BottomNavigationState> {
  final IBottomNavigationRepository _bottomnavigationRepository =
      BottomNavigationRepository();

  BottomNavigationController()
      : super(
          BottomNavigationState(
              selectedTab: 0,
              dropdownvalue: '7 Days',
              historyFilterValue: '7 Days'),
        );

  void changeTap(int value) {
    state = state.copyWith(selectedTab: value);
  }

  void showCharts({required String symbol}) {
    state = state.copyWith(selectedTab: 1, selectedSymbol: symbol);
  }

  void setChartToDefault() {
    state = state.copyWith(selectedSymbol: 'AUDCAD');
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
          titleWidget: Row(
            children: [
              GlobalText(
                str: "Trade",
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: KColor.white.color,
              ),
              SizedBox(
                width: 6.w,
              ),
              Consumer(builder: (context, ref, snapshot) {
                final tradeState = ref.watch(tradesProvider);
                return GlobalText(
                  str: tradeState.totalProfit == null
                      ? ''
                      : "${tradeState.totalProfit!.toStringAsFixed(5)} USD",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: tradeState.totalProfit?.isNegative == true
                      ? KColor.red.color
                      : KColor.white.color,
                );
              })
            ],
          ),
        );
      case 3:
        return GlobalAppbar(
          isShowMenubar: true,
          title: "History",
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 0, top: 10),
              child: Consumer(
                builder: (context, ref, snapshot) {
                  final state = ref.watch(bottomNavigationProvider);
                  final controller = ref.read(historyProvider.notifier);
                  return DropdownButton(
                    icon: Icon(
                      Icons.filter_alt,
                      color: KColor.white.color,
                    ),
                    items: state.items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Row(
                          children: [
                            Icon(
                              state.dropdownvalue == items
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: KColor.mineShaftCommmon.color,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            GlobalText(
                              str: items,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: KColor.mineShaftCommmon.color,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      this.state = state.copyWith(historyFilterValue: newValue);
                      controller.fetchHistory(newValue ?? '');
                    },
                  );
                },
              ),
            ),
          ],
        );
      case 1:
        return GlobalAppbar(
          isShowMenubar: true,
          title: "Chart ${state.selectedSymbol}",
        );
      default:
        return GlobalAppbar(
          isShowMenubar: true,
        );
    }
  }
}
