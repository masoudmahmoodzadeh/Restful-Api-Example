

import 'package:restful_api_example/screens/ticker/data/repository/ticker_repository.dart';

class GetTickerUseCase {
  void getTicker(String symbol,TickerCallBack callBack) {
    TickerRepository repository = TickerRepository();
    repository.getTicker(symbol,callBack);
  }

}