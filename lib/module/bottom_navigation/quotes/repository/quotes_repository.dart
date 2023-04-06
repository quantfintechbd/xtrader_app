import 'package:dio/dio.dart';
import 'package:xtrader_app/constant/constant_key.dart';
import 'package:xtrader_app/data_provider/pref_helper.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/model/quotes_details_response.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/repository/quotes_api.dart';

import 'quotes_interface.dart';

class QuotesRepository implements IQuotesRepository {
  final QuotesApi _api = QuotesApi();
  @override
  Future loadQuotes({
    required Map<String, dynamic> symbols,
    required Function(List<Quotes>) onSuccess,
  }) async {
    await _api
        .loadQuotes(
            params: symbols,
            onSuccess: (Response response) {
              QuotesDetailsResponse result =
                  QuotesDetailsResponse.fromJson(response.data);
              if (result.globalResponse?.code == 200 &&
                  result.data != null &&
                  result.data?.isNotEmpty == true) {
                onSuccess(result.data!);
              } else {
                throw Exception('Data is empty');
              }
            })
        .catchError((Object v) {
      throw Exception(v);
    });
  }
}
