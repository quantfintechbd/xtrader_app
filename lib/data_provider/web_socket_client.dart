import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_socket_channel/io.dart';
import 'package:xtrader_app/constant/app_url.dart';
import 'package:xtrader_app/constant/constant_key.dart';
import 'package:xtrader_app/data_provider/pref_helper.dart';
import 'package:xtrader_app/global/widget/error_dialog.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/view_util.dart';

//final SocketClient sharedSocketClient = SocketClient();

class SocketClient {
  static final SocketClient _singleton = SocketClient._internal();
  late IOWebSocketChannel _channel;
  factory SocketClient() {
    return _singleton;
  }
  SocketClient._internal();

  void connectAndSratListening({
    required Function(dynamic data) onData,
    required Function() onDone,
    required Function(dynamic error) onError,
  }) {
    final wsUrl = PrefHelper.getString(AppConstant.SOOCKET_URL.key);
    _channel = IOWebSocketChannel.connect(
      Uri.parse(
          wsUrl), //wss://ws.postman-echo.com/raw//AppUrl.webSocketUrl.url)
    );
    _channel.stream.listen((data) {
      //data.log();
      onData(data);
    }, onDone: () {
      onDone();
    }, onError: (error) {
      ViewUtil.showAlertDialog(
        barrierDismissible: false,
        contentPadding: EdgeInsets.zero,
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
        content: const ErrorDialog(
          erroMsg: 'Market data disconnected!', //error.toString(),
          title: "Connection Error!",
        ),
      );
      onError(error);
    });
  }

  void sendMessage(String message) {
    _channel.sink.add(message);
  }

  void closeConnection() {
    // _channel.sink.close();
  }
}
