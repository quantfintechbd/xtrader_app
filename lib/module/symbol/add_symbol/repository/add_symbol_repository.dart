import 'package:xtrader_app/constant/constant_key.dart';
import 'package:xtrader_app/data_provider/pref_helper.dart';

import 'add_symbol_interface.dart';

class AddSymbolRepository implements IAddSymbolRepository {
  @override
  Future<List<String>> fetchLocalSymbols() async {
    return await PrefHelper.getStringList(AppConstant.LOCAL_SYMBOLS.key);
  }

  @override
  Future<List<String>> fetchRemoteSymbols() async {
    return await PrefHelper.getStringList(AppConstant.REMOTE_SYMBOLS.key);
  }

  @override
  void updateLocal(List<String> symbols) {
    PrefHelper.setStringList(AppConstant.LOCAL_SYMBOLS.key, symbols);
  }
}
