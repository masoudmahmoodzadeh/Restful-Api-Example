import 'package:get/get.dart';

import '../../../apis/api_error_callback.dart';
import '../../../apis/api_error_dialog.dart';
import '../domain/get_list_crypto_use_case.dart';

class CryptoController extends GetxController {
  var listCrypto = [].obs;

  @override
  void onInit() {
    _getListCrypto();
  }

  void _getListCrypto() {
    GetListCryptoUseCase().getList(
      (data) => listCrypto.value = data,
      ApiErrorCallback(
        onBadRequest: (error) {
          Get.find<ApiErrorDialog>().badRequest(error);
        },
        onUnauthorized: () {
          Get.find<ApiErrorDialog>().unAuthorized();
        },
        onServerError: (statusCode) {
          Get.find<ApiErrorDialog>().serverError(statusCode);
        },
        onSocketConnection: () {
          Get.find<ApiErrorDialog>().noInternet();
        },
        onTimeout: () {
          Get.find<ApiErrorDialog>().timeout();
        },
        onFailed: (String message) {
          Get.find<ApiErrorDialog>().failed(message);
        },
      ),
    );
  }
}
