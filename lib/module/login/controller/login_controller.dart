import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtrader_app/global/widget/global_loader.dart';
import 'package:xtrader_app/module/login/controller/state/login_state.dart';
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
          ),
        ) {
    state.userIdController.addListener(() {
      _validate();
    });
    state.passwordController.addListener(() {
      _validate();
    });
  }

  void _validate() {
    if (state.userIdController.text.isNotEmpty &&
        state.passwordController.text.isNotEmpty) {
      state = state.copyWith(isValid: true);
    } else {
      state = state.copyWith(isValid: false);
    }
  }

  Future login(BuildContext context) async {
    bool loginSuccess = false;
    ;
    if (state.isValid) {
      final LoginRequesteModel loginRequestModel = LoginRequesteModel(
        userName: state.userIdController.text.toLowerCase(),
        password: state.passwordController.text,
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
            loginSuccess = true;
            Navigation.pop(context);
            state.userIdController.clear();
            state.passwordController.clear();
            "hrlr".log();
            Navigation.pushAndRemoveUntil(
              context,
              appRoutes: AppRoutes.loadSymbol,
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

  @override
  void dispose() {
    state.userIdController.dispose();
    state.userIdController.dispose();
    super.dispose();
  }
}
