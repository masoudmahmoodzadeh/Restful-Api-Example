import 'package:restful_api_example/screens/crypto/data/repository/crypto_repository.dart';

import '../../../apis/api_error_callback.dart';

class GetListCryptoUseCase {
  void getList(ListCryptoCallback callback, [ApiErrorCallback? errorCallback]) {
    CryptoRepository repository = CryptoRepository();
    repository.getListCrypto(callback, errorCallback);
  }
}
