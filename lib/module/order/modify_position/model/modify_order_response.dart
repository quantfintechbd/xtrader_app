import 'package:xtrader_app/global/model/global_response.dart';

class ModifyOrderResponse {
  ModifyStepOne? data;
  GlobalResponse? globalResponse;
  ModifyOrderResponse({this.data, this.globalResponse});

  ModifyOrderResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ModifyStepOne.fromJson(json['data']) : null;
    globalResponse = GlobalResponse.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = globalResponse?.code;
    data['error'] = globalResponse?.error;
    data['message'] = globalResponse?.message;
    return data;
  }
}

class ModifyStepOne {
  String? pageId;
  ModifyResponse? response;

  ModifyStepOne({this.pageId, this.response});

  ModifyStepOne.fromJson(Map<String, dynamic> json) {
    pageId = json['pageId'];
    response = json['response'] != null
        ? new ModifyResponse.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageId'] = this.pageId;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class ModifyResponse {
  String? message;
  ModifyStepOne? data;

  ModifyResponse({this.message, this.data});

  ModifyResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? ModifyStepOne.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ModifyStepTwo {
  int? id;

  ModifyStepTwo({this.id});

  ModifyStepTwo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
