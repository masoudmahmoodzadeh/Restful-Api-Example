import 'package:get/get.dart';

import '../../../apis/api_error_callback.dart';
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
        onBadRequest: (error) {},
        onUnauthorized: () {},
        onServerError: (statusCode) {},
        onSocketConnection: () {},
        onTimeout: () {},
        onFailed: (String message) {},
      ),
    );
  }
}
