import 'package:restful_api_example/apis/method_type.dart';

import '../../../../../apis/base_app_request.dart';

class TickerRequest extends BaseAppRequest {

  final String symbol;


  TickerRequest(this.symbol);

  @override
  String getApiAddress() {
    return "/api/v3/ticker/24hr";
  }

  @override
  MethodType getApiMethod() {
    return MethodType.getQueryString;
  }

  @override
  TickerRequest fromJson(Map<String, dynamic> json) {
    return TickerRequest(json['symbol']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {"symbol":symbol};
  }
}
