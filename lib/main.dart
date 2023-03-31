import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//localization
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:xtrader_app/constant/app_url.dart';
import 'package:xtrader_app/data_provider/pref_helper.dart';
import 'package:xtrader_app/module/landing/views/landing_screen.dart';
import 'package:xtrader_app/module/symbol/buy_sell/views/buy_sell_screen.dart';

import 'package:xtrader_app/utils/app_version.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/navigation.dart';
import 'package:xtrader_app/utils/network_connection.dart';
import 'package:xtrader_app/utils/styles/k_colors.dart';
import 'package:xtrader_app/utils/styles/k_text_style.dart';
import 'package:xtrader_app/utils/theme/theme_controller.dart';
import 'package:xtrader_app/utils/theme/theme_util.dart';

import 'constant/constant_key.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  //Set Potraite Mode only
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(ProviderScope(child: MyApp()));
}

/// Make sure you always init shared pref first. It has token and token is need
/// to make API call
initServices() async {
  AppUrlExtention.setUrl(
    UrlLink.isDev,
  );
  // ThemeUtil.appTheme = XtraderTheme.dark;
  await PrefHelper.init();
  await AppVersion.getVersion();
  await NetworkConnection.instance.InternetAvailable();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    return ScreenUtilInit(
      //Change the height and Width based on design
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (ctx, child) {
        return Consumer(builder: (context, ref, snap) {
          final themeController = ref.watch(themeProvider);
          return MaterialApp(
            title: 'xtrader_app',
            navigatorKey: Navigation.key,
            debugShowCheckedModeBanner: false,
            //localization
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            locale: (PrefHelper.getLanguage() == 1)
                ? const Locale('en', 'US')
                : const Locale('bn', 'BD'),
            theme: ThemeData(
              progressIndicatorTheme: ProgressIndicatorThemeData(
                color: KColor.secondary.color,
              ),
              fontFamily: AppConstant.FONTFAMILY.key,
              primaryColor: KColor.primary.color,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              colorScheme: ThemeData().colorScheme.copyWith(
                    tertiaryContainer: KColor.mineShaft.color,
                    secondary: KColor.secondary.color,
                    tertiary: KColor.scondaryTextColor.color,
                  ),
              textTheme: TextTheme(
                displayLarge: KTextStyle.customTextStyle(
                    color: KColor.textColorDark.color),
                displaySmall: KTextStyle.customTextStyle(
                    color: KColor.scondaryTextColor.color),
              ),
              // primarySwatch: KColor.primary.color as MaterialColor,
            ),
            darkTheme: ThemeData(
              progressIndicatorTheme: ProgressIndicatorThemeData(
                color: KColor.secondary.color,
              ),
              fontFamily: AppConstant.FONTFAMILY.key,
              primaryColor: KColor.primary.color,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              colorScheme: ThemeData().colorScheme.copyWith(
                    tertiaryContainer: KColor.mineShaft.color,
                    secondary: KColor.secondary.color,
                    tertiary: KColor.scondaryTextColor.color,
                  ),
              textTheme: TextTheme(
                displayLarge: KTextStyle.customTextStyle(
                    color: KColor.textColorDark.color),
                displaySmall: KTextStyle.customTextStyle(
                    color: KColor.scondaryTextColor.color),
              ),
            ),
            themeMode: themeController.theme == XtraderTheme.light
                ? ThemeMode.light
                : ThemeMode.dark,
            home: child,
          );
        });
      },
      child: BuySellScreen(),
    );
  }
}
