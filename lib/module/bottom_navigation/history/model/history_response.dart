import 'package:xtrader_app/global/model/global_response.dart';

class HistoryResponse {
  HistoryData? data;
  GlobalResponse? globalResponse;
  HistoryResponse({this.data, this.globalResponse});

  HistoryResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? HistoryData.fromJson(json['data']) : null;
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

class HistoryData {
  Summery? summery;
  List<HistoryDetails>? details;
  String? total;

  HistoryData({this.summery, this.details, this.total});

  HistoryData.fromJson(Map<String, dynamic> json) {
    summery =
        json['summery'] != null ? Summery.fromJson(json['summery']) : null;
    if (json['details'] != null) {
      details = <HistoryDetails>[];
      json['details'].forEach((v) {
        details!.add(HistoryDetails.fromJson(v));
      });
    }
    total = json['total'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (summery != null) {
      data['summery'] = summery!.toJson();
    }
    if (details != null) {
      data['details'] = details!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    return data;
  }
}

class Summery {
  String? profit;
  String? deposit;
  String? swap;
  String? commission;
  String? balance;

  Summery(
      {this.profit, this.deposit, this.swap, this.commission, this.balance});

  Summery.fromJson(Map<String, dynamic> json) {
    profit = json['Profit'].toString();
    deposit = json['Deposit'].toString();
    swap = json['Swap'].toString();
    commission = json['Commission'].toString();
    balance = json['Balance'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Profit'] = this.profit;
    data['Deposit'] = this.deposit;
    data['Swap'] = this.swap;
    data['Commission'] = this.commission;
    data['Balance'] = this.balance;
    return data;
  }
}

class HistoryDetails {
  String? symbol;
  String? action;
  String? actionValue;
  String? volume;
  String? commission;
  String? priceSL;
  String? priceTP;
  String? profit;
  String? positionID;
  String? swap;
  String? time;
  String? closeTime;

  HistoryDetails({
    this.symbol,
    this.action,
    this.actionValue,
    this.volume,
    this.commission,
    this.priceSL,
    this.priceTP,
    this.profit,
    this.positionID,
    this.swap,
    this.time,
    this.closeTime,
  });

  HistoryDetails.fromJson(Map<String, dynamic> json) {
    symbol = json['Symbol'];
    action = json['Action'];
    actionValue = json['ActionValue'].toString();
    volume = json['Volume'].toString();
    commission = json['Commission'].toString();
    priceSL = json['PriceSL'].toString();
    priceTP = json['PriceTP'].toString();
    profit = json['Profit'].toString();
    positionID = json['PositionID'].toString();
    swap = json['Swap'].toString();
    time = json['Time'];
    closeTime = json['CloseTime'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Symbol'] = this.symbol;
    data['Action'] = this.action;
    data['ActionValue'] = this.actionValue;
    data['Volume'] = this.volume;
    data['Commission'] = this.commission;
    data['PriceSL'] = this.priceSL;
    data['PriceTP'] = this.priceTP;
    data['Profit'] = this.profit;
    data['PositionID'] = this.positionID;
    data['Swap'] = this.swap;
    data['Time'] = this.time;
    data['CloseTime'] = this.closeTime;
    return data;
  }
}
