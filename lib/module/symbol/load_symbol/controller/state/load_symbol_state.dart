class LoadSymbolState {
  final int totalCount;
  final int startIndex, endIndex;
  final List<String> remoteSymbols;
  final int limit = 30;
  LoadSymbolState({
    required this.startIndex,
    required this.endIndex,
    required this.totalCount,
    required this.remoteSymbols,
  });

  LoadSymbolState copyWith(
      {int? totalCount,
      int? startIndex,
      int? endIndex,
      List<String>? remoteSymbols}) {
    return LoadSymbolState(
      totalCount: totalCount ?? this.totalCount,
      startIndex: startIndex ?? this.startIndex,
      endIndex: endIndex ?? this.endIndex,
      remoteSymbols: remoteSymbols ?? this.remoteSymbols,
    );
  }
}
