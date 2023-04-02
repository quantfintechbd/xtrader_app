import 'package:xtrader_app/global/model/global_response.dart';

class TotalSymbolResponse {
  TotalSymbolData? data;
  GlobalResponse? globalResponse;

  TotalSymbolResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? TotalSymbolData.fromJson(json['data']) : null;
    globalResponse = GlobalResponse.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = globalResponse?.code ?? 0;
    data['error'] = globalResponse?.error;
    data['message'] = globalResponse?.message;
    return data;
  }
}

class TotalSymbolData {
  String? total;

  TotalSymbolData({this.total});

  TotalSymbolData.fromJson(Map<String, dynamic> json) {
    total = json['total'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = total.toString();
    return data;
  }
}
