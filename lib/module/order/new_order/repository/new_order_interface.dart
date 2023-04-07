import 'package:flutter/material.dart';
import 'package:xtrader_app/module/order/new_order/model/new_order_request.dart';

import '../../modify_position/model/modify_order_response.dart';

@immutable
abstract class INewOrderRepository {
  Future requestNewOrder({
    required NewOrderRequest data,
    required Function(ModifyOrderResponse data) onSuccess,
  });
}
