import 'package:get/get.dart';
import 'package:restful_api_example/screens/trade/ui/trade_controller.dart';

class TradeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TradeController());
  }
}
