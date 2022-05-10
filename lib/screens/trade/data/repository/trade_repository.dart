import '../../../../apis/api_manager.dart';
import '../../../../apis/response_callback.dart';
import '../../../crypto/data/source/remote/list_crypto_response.dart';
import '../source/remote/list_trade_request.dart';
import '../source/remote/list_trade_response.dart';

typedef ListTradeCallback = Function(List<ListTradeResponse> data);

class TradeRepository {
  void getListTrades(String symbol, int limit, ListTradeCallback callback) {
    ApiManager apiManager = ApiManager();
    apiManager.sendRequest(ListTradeRequest(symbol, limit),
        ResponseCallback<List<ListCryptoResponse>>(
      onSuccess: ((json) {
        List<ListTradeResponse> data = (json as List)
            .map((item) => ListTradeResponse.fromJson(item))
            .toList();

        callback(data);
      }),
    ));
  }
}
