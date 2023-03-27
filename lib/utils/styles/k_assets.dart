import 'package:xtrader_app/utils/theme_util.dart';

enum KAssetName {
  landingBackground,
  logo,
  homeInactive,
  historyInactive,
  chartsInactive,
  quotesActive,
  tradeInactive,
  add,
  edit,
  menu,
  backArrow,
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
      case KAssetName.historyInactive:
        return '$_svgDir/icon_history_inactive.svg';
      case KAssetName.homeInactive:
        return '$_svgDir/icon_home_inactive.svg';
      case KAssetName.quotesActive:
        return '$_svgDir/icon_quotes_active.svg';
      case KAssetName.tradeInactive:
        return '$_svgDir/icon_trade_inactive.svg';
      case KAssetName.add:
        return '$_svgDir/add.svg';
      case KAssetName.edit:
        return '$_svgDir/edit.svg';
      case KAssetName.menu:
        return '$_svgDir/menu.svg';
      case KAssetName.backArrow:
        return '$_svgDir/backArrow.svg';

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
