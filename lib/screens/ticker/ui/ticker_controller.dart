import 'package:get/get.dart';
import 'package:restful_api_example/screens/ticker/data/source/remote/ticker_response.dart';
import 'package:restful_api_example/screens/ticker/domain/get_ticker_use_case.dart';

import '../../crypto/data/source/remote/list_crypto_response.dart';

class TickerController extends GetxController {
 late ListCryptoResponse crypto;
  var  ticker =Rxn<TickerResponse?>();



  @override
  void onReady() {
    _getTicker();
    super.onReady();
  }

  void _getTicker() {
    GetTickerUseCase().getTicker(crypto.symbol,(data) => ticker.value = data);
  }


  bool isLoading(){
    return ticker.value==null;
  }
}
