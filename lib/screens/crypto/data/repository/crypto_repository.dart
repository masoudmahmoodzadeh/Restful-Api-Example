import '../../../../apis/api_manager.dart';
import '../../../../apis/response_callback.dart';
import '../source/remote/list_crypto_request.dart';
import '../source/remote/list_crypto_response.dart';

typedef ListCryptoCallBack = Function(List<ListCryptoResponse> data);

class CryptoRepository {
  void getListCrypto(ListCryptoCallBack callBack) {
    ApiManager apiManager = ApiManager();
    apiManager.sendRequest(ListCryptoRequest(),
        ResponseCallback<List<ListCryptoResponse>>(
      onSuccess: ((json) {
        List<ListCryptoResponse> data = (json as List)
            .map((item) => ListCryptoResponse.fromJson(item))
            .toList();
        callBack(data);
      }),
    ));
  }
}
