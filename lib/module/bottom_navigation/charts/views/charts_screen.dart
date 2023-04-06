import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:xtrader_app/constant/app_url.dart';
import 'package:xtrader_app/constant/constant_key.dart';
import 'package:xtrader_app/data_provider/pref_helper.dart';
import 'package:xtrader_app/utils/extension.dart';

class ChartsScreen extends StatelessWidget {
  const ChartsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userName = PrefHelper.getString(AppConstant.USER_NAME.key);
    final token = PrefHelper.getString(AppConstant.TOKEN.key);
    InAppWebViewController? webViewController;
    InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false,
        ),
        android: AndroidInAppWebViewOptions(
          useHybridComposition: true,
        ),
        ios: IOSInAppWebViewOptions(
          allowsInlineMediaPlayback: true,
        ));
    return Container(
      width: 450,
      height: 1000,
      color: Colors.black,
      child: InAppWebView(
        onLoadError: (controller, url, code, message) {
          message.log();
        },
        onLoadStart: (controller, url) {
          url?.toString().log();
        },
        onLoadHttpError: (controller, url, statusCode, description) {
          statusCode.log();
          description.log();
        },
        initialOptions: options,
        initialUrlRequest: URLRequest(
          headers: {
            'Content-Type': 'text/html; charset=utf-8',
            'Authenticated': 'Username $userName',
            'Authorization': 'Bearer $token',
          },
          url: Uri.parse(
            "https://api.xtraderplatform.com/index.php/chart-show?symbol=AUDCAD",
          ),
        ),
      ),
    );
  }
}
