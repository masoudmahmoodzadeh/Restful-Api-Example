import 'package:restful_api_example/apis/api_error_callback.dart';

import '../../../../apis/api_manager.dart';
import '../source/remote/list_crypto_request.dart';
import '../source/remote/list_crypto_response.dart';

typedef ListCryptoCallback = Function(List<ListCryptoResponse> data);

class CryptoRepository {
  void getListCrypto(ListCryptoCallback callback,
      [ApiErrorCallback? errorCallback]) {
    ApiManager apiManager = ApiManager();
    apiManager.sendRequest(
      request: ListCryptoRequest(),
      onSuccess: (json) {
        List<ListCryptoResponse> data = (json as List)
            .map((item) => ListCryptoResponse.fromJson(item))
            .toList();
        callback(data);
      },
      errorCallback: errorCallback,
    );
  }
}
