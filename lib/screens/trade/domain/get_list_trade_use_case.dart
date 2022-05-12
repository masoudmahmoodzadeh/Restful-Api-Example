import 'package:restful_api_example/screens/trade/data/repository/trade_repository.dart';

import '../../../apis/api_error_callback.dart';

class GetListTradeUseCase {
  void getListTrade(String symbol, int limit, ListTradeCallback callback,
      [ApiErrorCallback? errorCallback]) {
    TradeRepository repository = TradeRepository();
    repository.getListTrades(symbol, limit, callback, errorCallback);
  }
}
