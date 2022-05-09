import 'package:restful_api_example/apis/base/base_app_request.dart';
import 'package:restful_api_example/apis/base/method_type.dart';

class ListCryptoRequest extends BaseAppRequest {
  @override
  String getApiAddress() {
    return "/api/v3/ticker/price";
  }

  @override
  MethodType getApiMethod() {
    return MethodType.get;
  }

  @override
  ListCryptoRequest fromJson(Map<String, dynamic> json) {
    return ListCryptoRequest();
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
