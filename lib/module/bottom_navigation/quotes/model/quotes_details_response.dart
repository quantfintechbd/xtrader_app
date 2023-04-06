import 'package:xtrader_app/global/model/global_response.dart';

class QuotesDetailsResponse {
  List<Quotes>? data;
  GlobalResponse? globalResponse;

  QuotesDetailsResponse({this.data, this.globalResponse});

  QuotesDetailsResponse.fromJson(Map<String, dynamic> json) {
    data = [];
    if (json['data'] != null) {
      Map<String, dynamic> map = json['data'];
      map.entries.forEach((element) {
        data?.add(Quotes.fromJson(element.value));
      });
    }
    globalResponse = GlobalResponse.fromJson(json);
  }
}

class Quotes {
  String? symbol;
  String? bid;
  String? bidLow;
  String? bidHigh;
  String? ask;
  String? askLow;
  String? askHigh;
  String? priceOpen;
  String? priceClose;
  String? difference;
  String? time;

  Quotes(
      {this.symbol,
      this.bid,
      this.bidLow,
      this.bidHigh,
      this.ask,
      this.askLow,
      this.askHigh,
      this.priceOpen,
      this.priceClose,
      this.difference,
      this.time});

  Quotes.fromJson(Map<String, dynamic> json) {
    symbol = json['Symbol'].toString();
    bid = json['Bid'].toString();
    bidLow = json['BidLow'].toString();
    bidHigh = json['BidHigh'].toString();
    ask = json['Ask'].toString();
    askLow = json['AskLow'].toString();
    askHigh = json['AskHigh'].toString();
    priceOpen = json['PriceOpen'].toString();
    priceClose = json['PriceClose'].toString();
    difference = json['Difference'].toString();
    time = json['Time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Symbol'] = this.symbol;
    data['Bid'] = this.bid;
    data['BidLow'] = this.bidLow;
    data['BidHigh'] = this.bidHigh;
    data['Ask'] = this.ask;
    data['AskLow'] = this.askLow;
    data['AskHigh'] = this.askHigh;
    data['PriceOpen'] = this.priceOpen;
    data['PriceClose'] = this.priceClose;
    data['Difference'] = this.difference;
    data['Time'] = this.time;
    return data;
  }
}
