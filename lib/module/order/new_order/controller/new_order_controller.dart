import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/error_dialog.dart';
import 'package:xtrader_app/module/order/new_order/controller/state/new_order_state.dart';
import 'package:xtrader_app/module/order/new_order/model/new_order_request.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/navigation.dart';
import 'package:xtrader_app/utils/view_util.dart';

import '../../../bottom_navigation/trades/model/trade_details_response.dart';
import '../repository/new_order_interface.dart';
import '../repository/new_order_repository.dart';

final newOrderProvider =
    StateNotifierProvider.autoDispose<NewOrderController, NewOrderState>(
  (ref) => NewOrderController(),
);

class NewOrderController extends StateNotifier<NewOrderState> {
  final INewOrderRepository _neworderRepository = NewOrderRepository();
  NewOrderController()
      : super(
          NewOrderState(
            slController: TextEditingController(),
            tpController: TextEditingController(),
            priceController: TextEditingController(),
            isValid: false,
          ),
        ) {
    state.slController.addListener(
      () {
        validate();
      },
    );
    state.tpController.addListener(
      () {
        validate();
      },
    );
    state.priceController.addListener(() {
      validate();
    });
  }
  void setdetails(TradeDetails details) {
    state = state.copyWith(details: details);
  }

  void validate() {
    bool isValid = true;
    if (state.dropdownvalue?.isEmpty == true) {
      isValid = false;
    } else if (state.dropdownvalue != 'Instant Execution') {
      isValid = state.priceController.text.isNotEmpty &&
          state.priceController.text.parseToDouble() > 0.0;
    }

    state = state.copyWith(isValid: isValid);
  }

  void onchanged(String value) {
    state = state.copyWith(dropdownvalue: value);
    validate();
  }

  Future newOrder(BuildContext context, {required String action}) async {
    NewOrderRequest request = NewOrderRequest(
        buySell: action,
        symbol: state.details?.symbol,
        orderSize: state.details?.volume,
        price: state.priceController.text,
        orderExecutionType: state.dropdownvalue,
        slValue: state.slController.text,
        tpValue: state.tpController.text);
    _neworderRepository
        .requestNewOrder(
            data: request,
            onSuccess: (data) {
              Navigation.pop(context);
              ViewUtil.showAlertDialog(
                barrierDismissible: false,
                contentPadding: EdgeInsets.zero,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.r),
                ),
                content: ErrorDialog(
                  erroMsg: data.globalResponse?.message ?? '',
                  title: "Success!",
                  callbackAction: (_) {
                    Navigation.pop(context);
                  },
                ),
              );
            })
        .catchError((_) {
      Navigation.pop(context);
    });
  }
}
