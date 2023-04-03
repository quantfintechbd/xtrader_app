import 'package:flutter/material.dart';

@immutable
class RemoveSymbolState {
  final List<String> localSymbols, filtered;
  final TextEditingController searchController;

  const RemoveSymbolState(
      {required this.localSymbols,
      required this.filtered,
      required this.searchController});

  RemoveSymbolState copyWith(
      {List<String>? localSymbols, List<String>? filtered}) {
    return RemoveSymbolState(
      localSymbols: localSymbols ?? this.localSymbols,
      filtered: filtered ?? this.filtered,
      searchController: searchController,
    );
  }
}
