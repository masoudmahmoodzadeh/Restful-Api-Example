import 'package:restful_api_example/screens/ticker/data/source/remote/ticker_request.dart';
import 'package:restful_api_example/screens/ticker/data/source/remote/ticker_response.dart';

import '../../../../apis/api_manager.dart';
import '../../../../apis/response_callback.dart';

typedef TickerCallBack = Function(TickerResponse data);

class TickerRepository {
  void getTicker(String symbol, TickerCallBack callBack) {
    ApiManager apiManager = ApiManager();
    apiManager.sendRequest(TickerRequest(symbol),
        ResponseCallback<TickerResponse>(
      onSuccess: ((json) {
        TickerResponse data = TickerResponse.fromJson(json);
        callBack(data);
      }),

    ));
  }
}
