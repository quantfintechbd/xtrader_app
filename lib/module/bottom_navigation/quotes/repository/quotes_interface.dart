import 'package:flutter/material.dart';

import '../model/quotes_details_response.dart';

@immutable
abstract class IQuotesRepository {
  Future loadQuotes({
    required Map<String, dynamic> symbols,
    required Function(List<Quotes>) onSuccess,
  });
}
