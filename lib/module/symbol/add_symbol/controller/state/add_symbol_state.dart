import 'package:flutter/material.dart';

@immutable
class AddSymbolState {
  final List<String> remoteSymbols, localSymbols, unAttended;
  final TextEditingController searchController;
  final int totalCount;
  final int startIndex, endIndex;
  final bool isLoading;
  final int limit = 30;
  AddSymbolState({
    required this.remoteSymbols,
    required this.localSymbols,
    required this.unAttended,
    required this.searchController,
    required this.startIndex,
    required this.endIndex,
    required this.totalCount,
    required this.isLoading,
  });

  AddSymbolState copyWith({
    List<String>? remoteSymbols,
    List<String>? localSymbols,
    List<String>? unAttended,
    int? totalCount,
    int? startIndex,
    int? endIndex,
    bool? isLoading,
  }) {
    return AddSymbolState(
      localSymbols: localSymbols ?? this.localSymbols,
      remoteSymbols: remoteSymbols ?? this.remoteSymbols,
      unAttended: unAttended ?? this.unAttended,
      searchController: searchController,
      totalCount: totalCount ?? this.totalCount,
      startIndex: startIndex ?? this.startIndex,
      endIndex: endIndex ?? this.endIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
