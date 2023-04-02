import 'package:flutter/material.dart';

@immutable
abstract class IAddSymbolRepository {
  Future<List<String>> fetchLocalSymbols();
  Future<List<String>> fetchRemoteSymbols();
  void updateLocal(List<String> symbols);
}
