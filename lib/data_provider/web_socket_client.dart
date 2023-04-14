import 'package:web_socket_channel/io.dart';
import 'package:xtrader_app/constant/app_url.dart';

final SocketClient sharedSocketClient = SocketClient();

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
    _channel = IOWebSocketChannel.connect(
      Uri.parse(AppUrl.webSocketUrl.url), //wss://ws.postman-echo.com/raw
    );
    _channel.stream.listen((data) {
      onData(data);
    }, onDone: () {
      onDone();
    }, onError: (error) {
      onError(error);
    });
  }

  void sendMessage(String message) {
    _channel.sink.add(message);
  }

  void closeConnection() {
    _channel.sink.close();
  }
}
