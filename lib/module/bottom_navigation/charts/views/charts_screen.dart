import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:xtrader_app/constant/constant_key.dart';
import 'package:xtrader_app/data_provider/pref_helper.dart';
import 'package:xtrader_app/module/bottom_navigation/bottom_navigation_bar/controller/bottom_navigation_controller.dart';
import 'package:xtrader_app/utils/extension.dart';

class ChartsScreen extends ConsumerWidget {
  const ChartsScreen({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final contoller = ref.read(bottomNavigationProvider.notifier);
    final state = ref.watch(bottomNavigationProvider);
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
    return FocusDetector(
      onFocusLost: () {},
      child: Container(
        width: context.width,
        height: context.height,
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
              "https://api.xtraderplatform.com/index.php/chart-show?symbol=${state.selectedSymbol ?? 'AUDCAD'}&w=${context.width}&h=${context.height}",
            ),
          ),
        ),
      ),
    );
  }
}
