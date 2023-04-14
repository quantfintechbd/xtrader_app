import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:xtrader_app/data_provider/web_socket_client.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/model/quotes_details_response.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/model/socket_response_item.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/repository/quotes_api.dart';
import 'package:xtrader_app/module/order/modify_position/model/modify_request.dart';

import 'package:xtrader_app/module/order/modify_position/model/modify_order_response.dart';
import 'package:xtrader_app/module/order/modify_position/repository/modify_position_api.dart';

import 'modify_position_interface.dart';

class ModifyPositionRepository implements IModifyPositionRepository {
  final ModifyPositionApi _modifyPositionApi = ModifyPositionApi();
  final QuotesApi _quotesApi = QuotesApi();
  @override
  Future requestModifyResponse(
      {required ModifyOrderRequest data,
      required Function(ModifyOrderResponse data) onSuccess}) async {
    await _modifyPositionApi
        .requestModify(
            map: data.toJson(),
            onSuccess: (response) {
              ModifyOrderResponse result =
                  ModifyOrderResponse.fromJson(response.data);
              if (result.globalResponse?.code == 200 && result.data != null) {
                onSuccess(result);
              } else {
                //throw Exception("Data is not available");
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
    sharedSocketClient.connectAndSratListening(
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
    sharedSocketClient.closeConnection();
  }
}
