import 'package:flutter/material.dart';

import '../model/total_symbol_response.dart';

@immutable
abstract class ILoadSymbolRepository {
  Future getTotalCount({required Function(TotalSymbolData data) onsuccess});
  Future loadSymbols({
    required Map<String, dynamic> map,
    required Function(List<String> data) onsuccess,
  });
}
