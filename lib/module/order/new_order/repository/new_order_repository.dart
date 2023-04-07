import 'package:dio/dio.dart';
import 'package:xtrader_app/module/order/new_order/model/new_order_request.dart';

import 'package:xtrader_app/module/order/modify_position/model/modify_order_response.dart';
import 'package:xtrader_app/module/order/new_order/repository/new_order_api.dart';

import 'new_order_interface.dart';

class NewOrderRepository implements INewOrderRepository {
  final NewOrderApi _api = NewOrderApi();
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
}
