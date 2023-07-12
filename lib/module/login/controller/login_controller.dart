import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtrader_app/global/widget/global_loader.dart';
import 'package:xtrader_app/module/login/controller/state/login_state.dart';
import 'package:xtrader_app/module/login/model/broker_list_response.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/navigation.dart';

import '../../../constant/constant_key.dart';
import '../../../data_provider/pref_helper.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/view_util.dart';
import '../model/login_request_model.dart';
import '../repository/login_interface.dart';
import '../repository/login_repository.dart';

final loginProvider =
    StateNotifierProvider.autoDispose<LoginController, LoginState>(
  (ref) => LoginController(),
);

class LoginController extends StateNotifier<LoginState> {
  final ILoginRepository _loginRepository = LoginRepository();

  LoginController()
      : super(
          LoginState(
            isValid: false,
            userIdController: TextEditingController(),
            passwordController: TextEditingController(),
            shouldShowPassword: false,
            isPasswordFocused: false,
            isUserIdFocued: false,
          ),
        ) {
    fetchBrokerList();
    state.userIdController.addListener(() {
      _validate();
    });
    state.passwordController.addListener(() {
      _validate();
    });
    PrefHelper.setString(AppConstant.TOKEN.key, '');
    PrefHelper.setString(AppConstant.USER_NAME.key, '');
    PrefHelper.setString(AppConstant.NAME.key, '');
  }

  void _validate() {
    if (state.userIdController.text.isNotEmpty &&
        state.passwordController.text.isNotEmpty &&
        state.selectedBroker != null) {
      state = state.copyWith(isValid: true);
    } else {
      state = state.copyWith(isValid: false);
    }
  }

  Future fetchBrokerList() async {
    _loginRepository.fetchBrokers(onSuccess: (listData) {
      state = state.copyWith(brokers: listData, filteredBroker: []);
    });
  }

  Future login(BuildContext context) async {
    bool loginSuccess = false;
    ;
    if (state.isValid) {
      final LoginRequesteModel loginRequestModel = LoginRequesteModel(
        userName: state.userIdController.text.toLowerCase(),
        password: state.passwordController.text,
        broker: state.selectedBroker?.id ?? '',
      );

      ViewUtil.showAlertDialog(
        content: GlobalLoader(),
      );

      await _loginRepository
          .requestLogin(
        data: loginRequestModel,
        onSuccess: (loginData) {
          try {
            PrefHelper.setString(
              AppConstant.TOKEN.key,
              loginData.token ?? "",
            );
            PrefHelper.setString(
              AppConstant.USER_NAME.key,
              loginData.username ?? "",
            );
            PrefHelper.setString(
              AppConstant.NAME.key,
              loginData.name ?? "",
            );
            PrefHelper.setString(
              AppConstant.SOOCKET_URL.key,
              loginData.socket ?? '',
            );
            loginSuccess = true;
            Navigation.pop(context);
            state.userIdController.clear();
            state.passwordController.clear();
            final List<String> symbols =
                PrefHelper.getStringList(AppConstant.LOCAL_SYMBOLS.key);
            if (symbols.isEmpty) {
              PrefHelper.setStringList(AppConstant.LOCAL_SYMBOLS.key, [
                'EURUSD',
                "GBPUSD",
                "USDJPY",
                'AUDUSD',
                'USDCHF',
                'USDCAD',
                'GOLD',
                'BTCUSD',
              ]);
            }
            Navigation.pushAndRemoveUntil(
              context,
              appRoutes: AppRoutes.bottomNavigation,
            );
            state = state.copyWith(isValid: false);
          } catch (e) {
            "controller $e".log();
            state = state.copyWith(isValid: false);
            Navigation.pop(context);
          }
        },
      )
          .catchError((Object v) {
        "controller catchError $v".log();
        Navigation.pop(context);
      });
    }
  }

  void changePasswordState() {
    state = state.copyWith(shouldShowPassword: !state.shouldShowPassword);
  }

  void changeUserIdFocus(bool isfocused) {
    state = state.copyWith(isUserIdFocued: isfocused);
  }

  void changePasswordFocus(bool isfocused) {
    state = state.copyWith(isPasswordFocused: isfocused);
  }

  void searchBroker(String text) {
    if (text.length > 2) {
      final brokers = state.brokers?.where((element) {
        return element.name?.toLowerCase().contains(text.toLowerCase()) == true;
      });
      state = state.copyWith(filteredBroker: brokers?.toList());
    } else {
      state = state.copyWith(filteredBroker: []);
    }
  }

  void setSelectedBroker(Broker broker) {
    state = state.copyWith(selectedBroker: broker);
  }

  @override
  void dispose() {
    state.userIdController.dispose();
    state.userIdController.dispose();
    super.dispose();
  }
}
