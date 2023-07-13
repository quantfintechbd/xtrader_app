import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:xtrader_app/data_provider/web_socket_client.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/model/another_socket_response_item.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/model/quotes_details_response.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/repository/quotes_api.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../model/socket_response_item.dart';
import 'quotes_interface.dart';

class QuotesRepository implements IQuotesRepository {
  final QuotesApi _api = QuotesApi();
  @override
  Future loadQuotes({
    required Map<String, dynamic> symbols,
    required Function(List<Quotes>) onSuccess,
  }) async {
    await _api
        .loadQuotes(
            params: symbols,
            onSuccess: (Response response) {
              QuotesDetailsResponse result =
                  QuotesDetailsResponse.fromJson(response.data);
              if (result.globalResponse?.code == 200 &&
                  result.data != null &&
                  result.data?.isNotEmpty == true) {
                onSuccess(result.data!);
              } else {
                throw Exception('Data is empty');
              }
            })
        .catchError((Object v) {
      throw Exception(v);
    });
  }

  @override
  void socketData({required Function(List<SocketResponseItem> p1) onSuccess}) {
    SocketClient().connectAndSratListening(
        onData: (data) {
          List<SocketResponseItem> list = [];
          try {
            List<dynamic> dataList = json.decode(data);

            dataList.forEach((mapData) {
              Map<String, dynamic> map = mapData;
              list.add(SocketResponseItem.fromJson(map));
            });
          } catch (e) {
            try {
              final item = json.decode(data);
              list.add(
                AnotherSocketResponseItem.fromJson(item).socketResponseItem,
              );
            } catch (error) {
              "Socket Data Parse error".log();
              error.log();
            }
          }

          onSuccess(list);
        },
        onDone: () {},
        onError: (e) {});
  }

  @override
  void stopListening() {
    SocketClient().closeConnection();
  }
}
