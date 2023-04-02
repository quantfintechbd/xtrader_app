import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebSocketClient extends StateNotifier<WebSocketState> {
  WebSocketClient()
      : super(
          WebSocketState(
            data: [],
          ),
        ) {}

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class WebSocketState {
  final dynamic data;

  WebSocketState({required this.data});

  WebSocketState copyWith(dynamic? data) {
    return WebSocketState(
      data: data ?? this.data,
    );
  }
}
