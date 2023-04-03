import 'package:xtrader_app/utils/enum.dart';

enum AppUrl {
  base,
  baseImage,
  login,
  totalSymbol,
  symbolList,
  quotesDetails,
  newOrder,
  closeOrder,
  modifyOrder,
  tradeDetails,
  tradePostion,
}

extension AppUrlExtention on AppUrl {
  static String _baseUrl = "";
  static String _baseImageUrl = "";

  static void setUrl(UrlLink urlLink) {
    switch (urlLink) {
      case UrlLink.isLive:
        _baseUrl = "";
        _baseImageUrl = "";

        break;

      case UrlLink.isDev:
        _baseUrl = "http://api.xtraderplatform.com/index.php";
        _baseImageUrl = "";

        break;
      case UrlLink.isLocalServer:
        // set up your local server ip address.
        _baseUrl = "";
        break;
    }
  }

  String get url {
    switch (this) {
      case AppUrl.base:
        return "$_baseUrl";
      case AppUrl.baseImage:
        return "$_baseImageUrl";
      case AppUrl.login:
        return "/login";

      case AppUrl.totalSymbol:
        return "/total-symbol";
      case AppUrl.symbolList:
        return "/symbol-list";
      case AppUrl.quotesDetails:
        return "/quotes-details";
      case AppUrl.newOrder:
        return "/new-order";
      case AppUrl.closeOrder:
        return "/close-order";
      case AppUrl.modifyOrder:
        return "/modify-order";
      case AppUrl.tradeDetails:
        return "/trade-details";
      case AppUrl.tradePostion:
        return '/trade-position';
    }
    return "";
  }
}
