import 'package:flutter/material.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/model/socket_response_item.dart';
import 'package:xtrader_app/module/order/modify_position/model/modify_order_response.dart';
import 'package:xtrader_app/module/order/modify_position/model/modify_request.dart';

import '../../../bottom_navigation/quotes/model/quotes_details_response.dart';

@immutable
abstract class IModifyPositionRepository {
  Future requestModifyResponse({
    required ModifyOrderRequest data,
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
