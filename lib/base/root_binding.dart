import 'package:get/get.dart';
import 'package:restful_api_example/apis/api_error_dialog.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiErrorDialog());
  }
}
