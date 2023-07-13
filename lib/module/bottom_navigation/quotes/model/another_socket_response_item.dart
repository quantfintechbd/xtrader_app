import 'package:xtrader_app/module/bottom_navigation/quotes/model/socket_response_item.dart';
import 'package:xtrader_app/utils/extension.dart';

class AnotherSocketResponseItem {
  String? datetime;
  String? bid;
  String? ask;
  String? last;
  String? volume;
  String? datetimeMsc;
  String? volumeExt;
  String? symbol;

  AnotherSocketResponseItem(
      {this.datetime,
      this.bid,
      this.ask,
      this.last,
      this.volume,
      this.datetimeMsc,
      this.volumeExt,
      this.symbol});

  AnotherSocketResponseItem.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'].toString();
    if (json['bid'] != null) {
      final initialBid = json['bid'].toString();
      if (initialBid.split('.').last.length > 5) {
        bid = initialBid.parseToDouble().toStringAsFixed(5);
      } else {
        bid = initialBid;
      }
    } else {
      bid = '0.0';
    }
    if (json['ask'] != null) {
      final initialask = json['ask'].toString();
      if (initialask.split('.').last.length > 5) {
        ask = initialask.parseToDouble().toStringAsFixed(5);
      } else {
        ask = initialask;
      }
    } else {
      ask = '0.0';
    }

    last = json['last'].toString();
    volume = json['volume'].toString();
    datetimeMsc = json['datetime_msc'].toString();
    volumeExt = json['volume_ext'].toString();
    symbol = json['symbol'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['datetime'] = datetime;
    data['bid'] = bid;
    data['ask'] = ask;
    data['last'] = last;
    data['volume'] = volume;
    data['datetime_msc'] = datetimeMsc;
    data['volume_ext'] = volumeExt;
    data['symbol'] = symbol;
    return data;
  }

  SocketResponseItem get socketResponseItem {
    final one = bid?.split('.');
    return SocketResponseItem(
      symbol: symbol,
      digits: one?.last.length.toString(),
      bid: bid,
      ask: ask,
      time: datetime,
    );
  }
}
