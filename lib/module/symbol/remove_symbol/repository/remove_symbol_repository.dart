import '../../../../constant/constant_key.dart';
import '../../../../data_provider/pref_helper.dart';
import 'remove_symbol_interface.dart';

class RemoveSymbolRepository implements IRemoveSymbolRepository {
  @override
  Future<List<String>> fetchLocalSymbols() async {
    return await PrefHelper.getStringList(AppConstant.LOCAL_SYMBOLS.key);
  }

  @override
  void updateLocal(List<String> symbols) {
    PrefHelper.setStringList(AppConstant.LOCAL_SYMBOLS.key, symbols);
  }
}
