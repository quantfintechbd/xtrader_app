import 'package:flutter/material.dart';
import 'package:xtrader_app/module/bottom_navigation/bottom_navigation_bar/views/bottom_navigation_screen.dart';

import 'package:xtrader_app/module/landing/views/landing_screen.dart';
import 'package:xtrader_app/module/login/views/login_screen.dart';

enum AppRoutes { landing, login, bottomNavigation }

extension AppRoutesExtention on AppRoutes {
  Widget buildWidget<T extends Object>({T? arguments}) {
    switch (this) {
      case AppRoutes.landing:
        return LandingScreen();
      case AppRoutes.login:
        return LoginScreen();
      case AppRoutes.bottomNavigation:
        return BottomNavigationScreen();
    }
  }
}
