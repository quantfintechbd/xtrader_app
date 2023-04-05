import 'package:flutter/material.dart';

@immutable
class AddSymbolState {
  final List<String> remoteSymbols, localSymbols, unAttended;
  final TextEditingController searchController;
  AddSymbolState({
    required this.remoteSymbols,
    required this.localSymbols,
    required this.unAttended,
    required this.searchController,
  });

  AddSymbolState copyWith({
    List<String>? remoteSymbols,
    List<String>? localSymbols,
    List<String>? unAttended,
  }) {
    return AddSymbolState(
      localSymbols: localSymbols ?? this.localSymbols,
      remoteSymbols: remoteSymbols ?? this.remoteSymbols,
      unAttended: unAttended ?? this.unAttended,
      searchController: searchController,
    );
  }
}
