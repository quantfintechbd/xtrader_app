class SocketResponseItem {
  String? symbol;
  String? digits;
  String? bid;
  String? ask;
  String? time;

  SocketResponseItem({this.symbol, this.digits, this.bid, this.ask, this.time});

  SocketResponseItem.fromJson(Map<String, dynamic> json) {
    symbol = json['Symbol'];
    digits = json['Digits'].toString();
    bid = json['Bid'].toString();
    ask = json['Ask'].toString();
    time = json['time'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Symbol'] = this.symbol;
    data['Digits'] = this.digits;
    data['Bid'] = this.bid;
    data['Ask'] = this.ask;
    data['time'] = this.time;
    return data;
  }
}
