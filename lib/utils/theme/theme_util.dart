import 'package:xtrader_app/data_provider/pref_helper.dart';

enum XtraderTheme {
  dark,
  light,
}

extension ThemeUtil on XtraderTheme {
  static set appTheme(XtraderTheme theme) {
    PrefHelper.setBool("AppTheme", theme == XtraderTheme.light);
  }

  static XtraderTheme get appTheme {
    return PrefHelper.getBool("AppTheme")
        ? XtraderTheme.light
        : XtraderTheme.dark;
  }
}
