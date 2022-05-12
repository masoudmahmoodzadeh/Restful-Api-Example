import 'package:restful_api_example/screens/ticker/data/repository/ticker_repository.dart';

import '../../../apis/api_error_callback.dart';

class GetTickerUseCase {
  void getTicker(String symbol, TickerCallBack callBack,
      [ApiErrorCallback? errorCallback]) {
    TickerRepository repository = TickerRepository();
    repository.getTicker(symbol, callBack, errorCallback);
  }
}
