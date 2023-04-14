import 'package:intl/intl.dart';
import 'package:xtrader_app/global/model/global_response.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/model/socket_response_item.dart';
import 'package:xtrader_app/utils/extension.dart';

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

  Quotes quotesFrom(SocketResponseItem item) {
    return Quotes(
      symbol: symbol,
      bid: item.bid,
      ask: item.ask,
      bidHigh: item.bid.toString().parseToDouble() >
              bidHigh.toString().parseToDouble()
          ? item.bid
          : bidHigh,
      bidLow: item.bid.toString().parseToDouble() <
              bidLow.toString().parseToDouble()
          ? item.bid
          : bidLow,
      askHigh: item.ask.toString().parseToDouble() >
              askHigh.toString().parseToDouble()
          ? item.ask
          : askHigh,
      askLow: item.ask.toString().parseToDouble() <
              askLow.toString().parseToDouble()
          ? item.ask
          : askLow,
      priceClose: priceClose,
      priceOpen: priceOpen,
      difference: getDifference(item),
      time: DateFormat('MM/dd HH:mm:ss').format(
        DateTime.now(),
      ),
    );
  }

  String getDifference(SocketResponseItem item) {
    switch (int.parse(item.digits ?? "0")) {
      case 5:
        return ((item.ask.toString().parseToDouble() -
                    item.bid.toString().parseToDouble()) *
                10000)
            .toStringAsFixed(2);
      case 3:
        return ((item.ask.toString().parseToDouble() -
                    item.bid.toString().parseToDouble()) *
                100)
            .toStringAsFixed(2);
      case 2:
        return ((item.ask.toString().parseToDouble() -
                    item.bid.toString().parseToDouble()) *
                10)
            .toStringAsFixed(2);
      default:
        return '0.00';
    }
  }
}

class QuotesChartData {
  final double bid, ask, time;

  QuotesChartData({required this.bid, required this.ask, required this.time});
}
