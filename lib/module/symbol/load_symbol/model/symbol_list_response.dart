import '../../../../global/model/global_response.dart';

class SymbolListResponse {
  List<String>? data;
  GlobalResponse? globalResponse;

  SymbolListResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'].cast<String>();
    globalResponse = GlobalResponse.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['code'] = globalResponse?.code;
    data['error'] = globalResponse?.error;
    data['message'] = globalResponse?.message;
    return data;
  }
}
