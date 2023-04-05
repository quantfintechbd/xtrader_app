import 'package:xtrader_app/module/order/modify_position/model/modify_request.dart';

import 'package:xtrader_app/module/order/modify_position/model/modify_order_response.dart';
import 'package:xtrader_app/module/order/modify_position/repository/modify_position_api.dart';

import 'modify_position_interface.dart';

class ModifyPositionRepository implements IModifyPositionRepository {
  ModifyPositionApi _modifyPositionApi = ModifyPositionApi();
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
}
