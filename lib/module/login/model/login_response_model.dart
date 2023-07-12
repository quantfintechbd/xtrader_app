import 'package:xtrader_app/global/model/global_response.dart';

class LoginResponseModel {
  LoginData? data;
  GlobalResponse? globalResponse;
  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    globalResponse = GlobalResponse.fromJson(json);
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = globalResponse?.code ?? 0;
    data['error'] = globalResponse?.error ?? "";
    data['message'] = globalResponse?.message ?? "";
    return data;
  }
}

class LoginData {
  String? token;
  String? username;
  String? name;
  String? socket;

  LoginData({this.token, this.username, this.name});

  LoginData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    username = json['username'];
    name = json['name'];
    socket = json['socket'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['username'] = this.username;
    data['name'] = this.name;
    data['socket'] = this.socket;
    return data;
  }
}
