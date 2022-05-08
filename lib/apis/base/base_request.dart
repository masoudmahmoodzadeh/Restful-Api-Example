abstract class BaseRequest {
  String getApiAddress();

  Map<String, String> getApiHeaders();

  MethodType getApiMethod();
}

enum MethodType { get, post, put, patch, delete }
