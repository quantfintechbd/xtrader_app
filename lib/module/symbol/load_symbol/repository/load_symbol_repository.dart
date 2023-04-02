import 'package:xtrader_app/module/symbol/load_symbol/model/symbol_list_response.dart';
import 'package:xtrader_app/module/symbol/load_symbol/model/total_symbol_response.dart';
import 'package:xtrader_app/utils/extension.dart';

import 'load_symbol_api.dart';
import 'load_symbol_interface.dart';

class LoadSymbolRepository implements ILoadSymbolRepository {
  final LoadSymbolApi _totalSymbolApi = LoadSymbolApi();

  @override
  Future<void> getTotalCount({
    required Function(TotalSymbolData data) onsuccess,
  }) async {
    await _totalSymbolApi.total(
      onSuccess: (response) {
        TotalSymbolResponse data = TotalSymbolResponse.fromJson(response.data);
        if (data.globalResponse?.code == 200 && data.data != null) {
          onsuccess(data.data!);
        } else {
          //throw Exception("Data is not available");
        }
      },
    ).catchError((error, stackTrace) {
      "repo : $error".log();
      throw Exception(error);
    });
  }

  @override
  Future loadSymbols({
    required Map<String, dynamic> map,
    required Function(List<String> data) onsuccess,
  }) async {
    await _totalSymbolApi
        .load(
      map: map,
      onSuccess: (response) {
        SymbolListResponse data = SymbolListResponse.fromJson(response.data);
        if (data.globalResponse?.code == 200 && data.data != null) {
          onsuccess(data.data!);
        } else {
          //throw Exception("Data is not available");
        }
      },
    )
        .catchError(
      (error, stackTrace) {
        "repo : $error".log();
        throw Exception(error);
      },
    );
  }
}
