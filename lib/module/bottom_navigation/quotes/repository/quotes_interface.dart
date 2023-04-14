import 'package:flutter/material.dart';

import '../model/quotes_details_response.dart';
import '../model/socket_response_item.dart';

@immutable
abstract class IQuotesRepository {
  Future loadQuotes({
    required Map<String, dynamic> symbols,
    required Function(List<Quotes>) onSuccess,
  });
  void socketData({
    required Function(List<SocketResponseItem>) onSuccess,
  });
  void stopListening();
}
