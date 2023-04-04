import 'package:xtrader_app/global/model/global_response.dart';

class TradeDetailsResponse {
  List<TradeDetails>? data;
  GlobalResponse? globalResponse;

  TradeDetailsResponse({this.data, this.globalResponse});

  TradeDetailsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TradeDetails>[];
      json['data'].forEach((v) {
        data!.add(TradeDetails.fromJson(v));
      });
    }
    globalResponse = GlobalResponse.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = globalResponse?.code;
    data['error'] = globalResponse?.error;
    data['message'] = globalResponse?.message;
    return data;
  }
}

class TradeDetails {
  String? position;
  String? symbol;
  String? action;
  String? volume;
  String? priceOpen;
  String? priceCurrent;
  String? sL;
  String? tP;
  String? profit;
  String? expertPositionID;
  String? swap;
  String? time;

  TradeDetails(
      {this.position,
      this.symbol,
      this.action,
      this.volume,
      this.priceOpen,
      this.priceCurrent,
      this.sL,
      this.tP,
      this.profit,
      this.expertPositionID,
      this.swap,
      this.time});

  TradeDetails.fromJson(Map<String, dynamic> json) {
    position = json['Position'].toString();
    symbol = json['Symbol'];
    action = json['Action'];
    volume = json['Volume'].toString();
    priceOpen = json['PriceOpen'].toString();
    priceCurrent = json['PriceCurrent'].toString();
    sL = json['SL'].toString();
    tP = json['TP'].toString();
    profit = json['Profit'].toString();
    expertPositionID = json['ExpertPositionID'].toString();
    swap = json['Swap'].toString();
    time = json['Time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Position'] = this.position;
    data['Symbol'] = this.symbol;
    data['Action'] = this.action;
    data['Volume'] = this.volume;
    data['PriceOpen'] = this.priceOpen;
    data['PriceCurrent'] = this.priceCurrent;
    data['SL'] = this.sL;
    data['TP'] = this.tP;
    data['Profit'] = this.profit;
    data['ExpertPositionID'] = this.expertPositionID;
    data['Swap'] = this.swap;
    data['Time'] = this.time;
    return data;
  }
}
