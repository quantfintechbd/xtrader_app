class ModifyOrderRequest {
  String? symbol;
  String? position;
  double? slValue;
  double? tpValue;

  ModifyOrderRequest({this.symbol, this.position, this.slValue, this.tpValue});

  ModifyOrderRequest.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    position = json['position'];
    slValue = json['sl_value'];
    tpValue = json['tp_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['symbol'] = symbol;
    data['position'] = position;
    data['sl_value'] = slValue;
    data['tp_value'] = tpValue;
    return data;
  }
}
