import 'package:flutter/material.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_details_response.dart';
import 'package:xtrader_app/module/order/new_order/views/new_order_screen.dart';
import 'package:xtrader_app/module/symbol/add_symbol/views/add_symbol_screen.dart';
import 'package:xtrader_app/module/bottom_navigation/bottom_navigation_bar/views/bottom_navigation_screen.dart';

import 'package:xtrader_app/module/landing/views/landing_screen.dart';
import 'package:xtrader_app/module/login/views/login_screen.dart';
import 'package:xtrader_app/module/symbol/load_symbol/views/load_symbol_screen.dart';

import 'package:xtrader_app/module/order/modify_position/views/modify_position_screen.dart';
import 'package:xtrader_app/module/symbol/remove_symbol/views/remove_symbol_screen.dart';

enum AppRoutes {
  landing,
  login,
  bottomNavigation,
  addSymbol,
  removeSymbol,
  modifyPosition,
  loadSymbol,
  newOrder
}

extension AppRoutesExtention on AppRoutes {
  Widget buildWidget<T extends Object>({T? arguments}) {
    switch (this) {
      case AppRoutes.landing:
        return LandingScreen();
      case AppRoutes.login:
        return LoginScreen();
      case AppRoutes.bottomNavigation:
        return BottomNavigationScreen();
      case AppRoutes.addSymbol:
        return AddSymbolScreen();
      case AppRoutes.removeSymbol:
        return RemoveSymbolScreen();
      case AppRoutes.modifyPosition:
        return ModifyPositionScreen(details: arguments as TradeDetails);
      case AppRoutes.loadSymbol:
        return LoadSymbolScreen();
      case AppRoutes.newOrder:
        return NewOrderScreen(details: arguments as TradeDetails);
    }
  }
}
