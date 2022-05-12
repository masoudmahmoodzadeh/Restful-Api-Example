import 'package:get/get.dart';

import '../../../apis/api_error_callback.dart';
import '../../../apis/api_error_dialog.dart';
import '../../crypto/data/source/remote/list_crypto_response.dart';
import '../data/source/remote/ticker_response.dart';
import '../domain/get_ticker_use_case.dart';

class TickerController extends GetxController {
  late ListCryptoResponse crypto;
  var ticker = Rxn<TickerResponse?>();

  @override
  void onReady() {
    _getTicker();
    super.onReady();
  }

  void _getTicker() {
    GetTickerUseCase().getTicker(
      crypto.symbol,
      (data) => ticker.value = data,
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

  bool isLoading() {
    return ticker.value == null;
  }
}
