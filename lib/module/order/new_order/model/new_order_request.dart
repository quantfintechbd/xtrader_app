class NewOrderRequest {
  String? buySell;
  String? symbol;
  String? orderSize;
  String? orderExecutionType;
  String? price;
  String? slValue;
  String? tpValue;

  NewOrderRequest(
      {this.buySell,
      this.symbol,
      this.orderSize,
      this.orderExecutionType,
      this.price,
      this.slValue,
      this.tpValue});

  NewOrderRequest.fromJson(Map<String, dynamic> json) {
    buySell = json['buy_sell'];
    symbol = json['symbol'];
    orderSize = json['order_size'];
    orderExecutionType = json['order_execution_type'];
    price = json['price'];
    slValue = json['sl_value'];
    tpValue = json['tp_value'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['buy_sell'] = buySell;
    data['symbol'] = symbol;
    data['order_size'] = orderSize;
    data['order_execution_type'] = orderExecutionType;
    data['price'] = price;
    data['sl_value'] = slValue;
    data['tp_value'] = tpValue;
    return data;
  }
}
