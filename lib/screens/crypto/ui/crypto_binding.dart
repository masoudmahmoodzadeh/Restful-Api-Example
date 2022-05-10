import 'package:get/get.dart';
import 'package:restful_api_example/screens/crypto/ui/crypto_controller.dart';

class CryptoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CryptoController());
  }
}
