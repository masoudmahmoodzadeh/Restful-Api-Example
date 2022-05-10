import 'package:restful_api_example/screens/trade/data/repository/trade_repository.dart';

class GetListTradeUseCase {
  void getListTrade(String symbol, int limit, ListTradeCallback callback) {
    TradeRepository repository = TradeRepository();
    repository.getListTrades(symbol, limit, callback);
  }
}
