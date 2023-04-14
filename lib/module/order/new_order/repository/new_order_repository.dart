import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:xtrader_app/data_provider/web_socket_client.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/model/socket_response_item.dart';
import 'package:xtrader_app/module/order/new_order/model/new_order_request.dart';

import 'package:xtrader_app/module/order/modify_position/model/modify_order_response.dart';
import 'package:xtrader_app/module/order/new_order/repository/new_order_api.dart';

import '../../../bottom_navigation/quotes/model/quotes_details_response.dart';
import '../../../bottom_navigation/quotes/repository/quotes_api.dart';
import 'new_order_interface.dart';

class NewOrderRepository implements INewOrderRepository {
  final NewOrderApi _api = NewOrderApi();
  final QuotesApi _quotesApi = QuotesApi();
  @override
  Future requestNewOrder(
      {required NewOrderRequest data,
      required Function(ModifyOrderResponse data) onSuccess}) async {
    _api
        .requestNewOrder(
            map: data.toJson(),
            onSuccess: (Response response) {
              final ModifyOrderResponse result =
                  ModifyOrderResponse.fromJson(response.data);
              if (result.globalResponse?.code == 200) {
                onSuccess(result);
              }
            })
        .catchError((Object V) {
      throw Exception(V);
    });
  }

  @override
  Future loadQuotes({
    required Map<String, dynamic> symbols,
    required Function(Quotes p1) onSuccess,
  }) async {
    await _quotesApi
        .loadQuotes(
            params: symbols,
            onSuccess: (Response response) {
              QuotesDetailsResponse result =
                  QuotesDetailsResponse.fromJson(response.data);
              if (result.globalResponse?.code == 200 &&
                  result.data != null &&
                  result.data?.isNotEmpty == true) {
                onSuccess(result.data!.first);
              } else {
                throw Exception('Data is empty');
              }
            })
        .catchError((Object v) {
      throw Exception(v);
    });
  }

  @override
  void socketData({
    required String symbol,
    required Function(SocketResponseItem p1) onSuccess,
  }) {
    SocketClient().connectAndSratListening(
        onData: (data) {
          List<dynamic> dataList = json.decode(data);
          for (var mapData in dataList) {
            Map<String, dynamic> map = mapData;
            if (mapData['Symbol'] == symbol) {
              onSuccess(SocketResponseItem.fromJson(map));
            }
          }
        },
        onDone: () {},
        onError: (e) {});
  }

  @override
  void stopListening() {
    SocketClient().closeConnection();
  }
}
