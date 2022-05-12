import 'package:get/get.dart';

import '../../../apis/api_error_callback.dart';
import '../../../apis/api_error_dialog.dart';
import '../../crypto/data/source/remote/list_crypto_response.dart';
import '../domain/get_list_trade_use_case.dart';

class TradeController extends GetxController {
  late ListCryptoResponse crypto;
  var listTrade = [].obs;

  @override
  void onReady() {
    _getListTrade();
    super.onReady();
  }

  void _getListTrade() {
    GetListTradeUseCase().getListTrade(
      crypto.symbol,
      20,
      (data) => listTrade.value = data,
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
