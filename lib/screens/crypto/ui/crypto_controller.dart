import 'package:get/get.dart';
import 'package:restful_api_example/screens/crypto/domain/get_list_crypto_use_case.dart';

class CryptoController extends GetxController {
  var listCrypto = [].obs;

  @override
  void onInit() {
    _getListCrypto();
  }

  void _getListCrypto() {
    GetListCryptoUseCase().getList((data) => listCrypto.value = data);
  }
}
