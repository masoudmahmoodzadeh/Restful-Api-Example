import 'package:restful_api_example/apis/method_type.dart';

import '../api_constants.dart';
import '../api_error_callback.dart';
import '../base_app_request.dart';

abstract class HttpRequest {
  void call(BaseAppRequest req, callback , ApiErrorCallback? errorCallback);

  MethodType getMethod();

  Uri getUriAddress(BaseAppRequest req) {
    return Uri.parse(ApiConstants.baseUrl + req.getApiAddress());
  }

  Uri generateApiAddressWithParams(String address) {
    return Uri.parse(ApiConstants.baseUrl + address);
  }
}
