import 'package:flutter/material.dart';
import 'package:xtrader_app/module/order/modify_position/model/modify_order_response.dart';
import 'package:xtrader_app/module/order/modify_position/model/modify_request.dart';

@immutable
abstract class IModifyPositionRepository {
  Future requestModifyResponse({
    required ModifyOrderRequest data,
    required Function(ModifyOrderResponse data) onSuccess,
  });
}
