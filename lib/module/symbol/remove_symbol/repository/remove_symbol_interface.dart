import 'package:flutter/material.dart';

@immutable
abstract class IRemoveSymbolRepository {
  Future<List<String>> fetchLocalSymbols();

  void updateLocal(List<String> symbols);
}
