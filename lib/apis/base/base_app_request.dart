import 'method_type.dart';

abstract class BaseAppRequest {
  MethodType getApiMethod();

  String getApiAddress();

  Map<String, dynamic> toJson();

  BaseAppRequest fromJson(Map<String, dynamic> json);

  Map<String, String> getApiHeaders() {
    return {
      'Content-Type': 'application/json;',
    };
  }
}
