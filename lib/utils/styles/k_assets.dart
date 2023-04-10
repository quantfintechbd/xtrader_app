import 'package:xtrader_app/utils/theme/theme_util.dart';

enum KAssetName {
  landingBackground,
  logo,
  homeInactive,
  historyInactive,
  historyActive,
  chartsInactive,
  chartsActive,
  quotesActive,
  quotesInactive,
  tradeInactive,
  tradeActive,
  add,
  edit,
  menu,
  backArrow,
  search,
  addGreen,
  remove,
  close,
  bag,
  barchart,
  upArrow,
  rightArrow,
  moon,
  eyeOpen,
  eyeOff,
  logout,
}

extension AssetsExtention on KAssetName {
  String get imagePath {
    String _rootPath = 'assets';
    String _svgDir = '$_rootPath/svg';
    String _imageDir = '$_rootPath/images';

    switch (this) {
      case KAssetName.landingBackground:
        return _themedAsset("landing-bg.svg", AssetType.svg);
      case KAssetName.logo:
        return _themedAsset("logo.png", AssetType.png);
      case KAssetName.chartsInactive:
        return '$_svgDir/icon_charts_inactive.svg';
      case KAssetName.chartsActive:
        return '$_svgDir/icon_charts_active.svg';
      case KAssetName.historyInactive:
        return '$_svgDir/icon_history_inactive.svg';
      case KAssetName.historyActive:
        return '$_svgDir/icon_history_active.svg';
      case KAssetName.homeInactive:
        return '$_svgDir/icon_home_inactive.svg';
      case KAssetName.quotesActive:
        return '$_svgDir/icon_quotes_active.svg';
      case KAssetName.quotesInactive:
        return '$_svgDir/icon_quotes_inactive.svg';
      case KAssetName.tradeInactive:
        return '$_svgDir/icon_trade_inactive.svg';
      case KAssetName.tradeActive:
        return '$_svgDir/icon_trade_active.svg';
      case KAssetName.add:
        return '$_svgDir/add.svg';
      case KAssetName.edit:
        return '$_svgDir/edit.svg';
      case KAssetName.menu:
        return '$_svgDir/menu.svg';
      case KAssetName.backArrow:
        return '$_svgDir/backArrow.svg';
      case KAssetName.search:
        return '$_svgDir/icon_search.svg';
      case KAssetName.addGreen:
        return '$_svgDir/add_green.svg';
      case KAssetName.remove:
        return '$_svgDir/icon_remove.svg';
      case KAssetName.close:
        return '$_svgDir/icon_close.svg';
      case KAssetName.bag:
        return _themedAsset("bag.svg", AssetType.svg);
      case KAssetName.barchart:
        return _themedAsset("bar-chart.svg", AssetType.svg);
      case KAssetName.upArrow:
        return '$_svgDir/up-arrow.svg';
      case KAssetName.rightArrow:
        return '$_svgDir/right-arrow.svg';
      case KAssetName.moon:
        return '$_svgDir/moon.svg';
      case KAssetName.eyeOff:
        return '$_svgDir/eye-off.svg';
      case KAssetName.eyeOpen:
        return '$_svgDir/ic_eye_open.svg';
      case KAssetName.logout:
        return '$_svgDir/logout.svg';
      default:
        return "";
    }
  }

  String _themedAsset(String name, AssetType type) {
    String _rootPath = 'assets';
    String _svgDir = '$_rootPath/svg';
    String _imageDir = '$_rootPath/images';
    String darkPath =
        type == AssetType.svg ? '$_svgDir/dark' : '$_imageDir/dark';
    String lightPath =
        type == AssetType.svg ? '$_svgDir/light' : '$_imageDir/light';
    return ThemeUtil.appTheme == XtraderTheme.light
        ? "$lightPath/$name"
        : "$darkPath/$name";
  }
}

enum AssetType { png, svg }
