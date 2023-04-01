import 'package:xtrader_app/module/login/model/login_response_model.dart';

import 'package:xtrader_app/module/login/model/login_request_model.dart';
import 'package:xtrader_app/utils/extension.dart';

import '/module/login/repository/login_interface.dart';
import 'login_api.dart';

class LoginRepository implements ILoginRepository {
  final LoginApi _loginApi = LoginApi();
  @override
  Future<void> requestLogin(
      {required LoginRequesteModel data,
      required Function(LoginData response) onSuccess}) async {
    await _loginApi
        .requestLogin(
            map: data.toMap(),
            onSuccess: (response) {
              LoginResponseModel data =
                  LoginResponseModel.fromJson(response.data);
              if (data.globalResponse?.code == 200 && data.data != null) {
                onSuccess(data.data!);
              } else {
                //throw Exception("Data is not available");
              }
            })
        .catchError((error, stackTrace) {
      "repo : $error".log();
      throw Exception(error);
    });
    ;
  }
}
