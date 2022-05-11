import 'package:get/get.dart';
import 'package:restful_api_example/screens/crypto/ui/crypto_binding.dart';
import 'package:restful_api_example/screens/crypto/ui/crypto_screen.dart';
import 'package:restful_api_example/screens/ticker/ui/ticker_binding.dart';
import 'package:restful_api_example/screens/ticker/ui/ticker_screen.dart';
import 'package:restful_api_example/screens/trade/ui/trade_binding.dart';
import 'package:restful_api_example/screens/trade/ui/trade_screen.dart';

class AppRoutes {
  static const String listCrypto = "/list_crypto";
  static const String listTrade = "/list_trade";
  static const String ticker = "/ticker";

  List<GetPage> routes() {
    return [
      GetPage(
        name: listCrypto,
        page: () => CryptoScreen(),
        binding: CryptoBinding(),
      ),
      GetPage(
        name: listTrade,
        page: () => TradeScreen(),
        binding: TradeBinding(),
      ) ,
      GetPage(
        name: ticker,
        page: () => TickerScreen(),
        binding: TickerBinding(),
      )
    ];
  }
}
