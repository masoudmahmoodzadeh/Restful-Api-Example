
import 'package:get/get.dart';
import 'package:restful_api_example/screens/ticker/ui/ticker_controller.dart';

class TickerBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => TickerController());
  }
}