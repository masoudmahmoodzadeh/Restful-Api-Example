import 'package:restful_api_example/screens/ticker/data/source/remote/ticker_request.dart';
import 'package:restful_api_example/screens/ticker/data/source/remote/ticker_response.dart';

import '../../../../apis/api_error_callback.dart';
import '../../../../apis/api_manager.dart';

typedef TickerCallBack = Function(TickerResponse data);

class TickerRepository {
  void getTicker(String symbol, TickerCallBack callBack,
      [ApiErrorCallback? errorCallback]) {
    ApiManager apiManager = ApiManager();
    apiManager.sendRequest(
      request: TickerRequest(symbol),
      onSuccess: (json) {
        TickerResponse data = TickerResponse.fromJson(json);
        callBack(data);
      },
      errorCallback: errorCallback,
    );
  }
}
