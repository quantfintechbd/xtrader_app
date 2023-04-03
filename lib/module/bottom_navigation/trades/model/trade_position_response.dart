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
  double? balance;
  double? equity;
  int? margin;
  double? marginFree;
  int? marginLevel;

  TradePositionData(
      {this.balance,
      this.equity,
      this.margin,
      this.marginFree,
      this.marginLevel});

  TradePositionData.fromJson(Map<String, dynamic> json) {
    balance = json['Balance'];
    equity = json['Equity'];
    margin = json['Margin'];
    marginFree = json['MarginFree'];
    marginLevel = json['MarginLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Balance'] = balance;
    data['Equity'] = equity;
    data['Margin'] = margin;
    data['MarginFree'] = marginFree;
    data['MarginLevel'] = marginLevel;
    return data;
  }
}
