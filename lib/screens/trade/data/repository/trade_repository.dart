import '../../../../apis/api_manager.dart';
import '../source/remote/list_trade_request.dart';
import '../source/remote/list_trade_response.dart';

typedef ListTradeCallback = Function(List<ListTradeResponse> data);

class TradeRepository {
  void getListTrades(String symbol, int limit, ListTradeCallback callback) {
    ApiManager apiManager = ApiManager();
    apiManager.sendRequest(
      request: ListTradeRequest(symbol, limit),
      onSuccess: (json) {
        List<ListTradeResponse> data = (json as List)
            .map((item) => ListTradeResponse.fromJson(item))
            .toList();

        callback(data);
      },
    );
  }
}
