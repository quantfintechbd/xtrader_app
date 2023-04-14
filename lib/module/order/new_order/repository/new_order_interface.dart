import 'package:flutter/material.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/model/socket_response_item.dart';
import 'package:xtrader_app/module/order/new_order/model/new_order_request.dart';

import '../../../bottom_navigation/quotes/model/quotes_details_response.dart';
import '../../modify_position/model/modify_order_response.dart';

@immutable
abstract class INewOrderRepository {
  Future requestNewOrder({
    required NewOrderRequest data,
    required Function(ModifyOrderResponse data) onSuccess,
  });
  Future loadQuotes({
    required Map<String, dynamic> symbols,
    required Function(Quotes) onSuccess,
  });
  void socketData({
    required String symbol,
    required Function(SocketResponseItem) onSuccess,
  });
  void stopListening();
}
