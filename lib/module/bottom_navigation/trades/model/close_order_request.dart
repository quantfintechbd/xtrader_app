class CloseOrderRequest {
  final String position, symbol, volume, action;
//   {
//     "position": 46517367,
//     "symbol":"EURUSD",
//     "volume":0.01,
//     "action": 0
// }

  CloseOrderRequest({
    required this.position,
    required this.symbol,
    required this.volume,
    required this.action,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'position': position,
      'symbol': symbol,
      'volume': volume,
      'action': action,
    };
  }
}
