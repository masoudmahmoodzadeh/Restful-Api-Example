import 'package:restful_api_example/screens/crypto/data/repository/crypto_repository.dart';

class GetListCryptoUseCase {
  void getList(ListCryptoCallBack callBack) {
    CryptoRepository repository = CryptoRepository();
    repository.getListCrypto(callBack);
  }
}
