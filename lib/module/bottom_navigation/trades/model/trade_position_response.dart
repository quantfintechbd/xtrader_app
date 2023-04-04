import 'package:xtrader_app/global/model/global_response.dart';

class TradePositionResponse {
  TradePositionData? data;
  GlobalResponse? globalResponse;
  TradePositionResponse({this.data, this.globalResponse});

  TradePositionResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new TradePositionData.fromJson(json['data'])
        : null;
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

class TradePositionData {
  String? balance;
  String? equity;
  String? margin;
  String? marginFree;
  String? marginLevel;

  TradePositionData(
      {this.balance,
      this.equity,
      this.margin,
      this.marginFree,
      this.marginLevel});

  TradePositionData.fromJson(Map<String, dynamic> json) {
    balance = json['Balance'].toString();
    equity = json['Equity'].toString();
    margin = json['Margin'].toString();
    marginFree = json['MarginFree'].toString();
    marginLevel = json['MarginLevel'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Balance'] = balance;
    data['Equity'] = equity;
    data['Margin'] = margin;
    data['MarginFree'] = marginFree;
    data['MarginLevel'] = marginLevel;
    return data;
  }
}
