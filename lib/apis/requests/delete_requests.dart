import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';
import 'package:restful_api_example/apis/method_type.dart';

import '../api_error_callback.dart';
import '../base_app_request.dart';
import 'http_request.dart';

class DeleteRequests extends HttpRequest {
  @override
  void call(
      BaseAppRequest req, callback, ApiErrorCallback? errorCallback) async {
    try {
      var response = await delete(
        getUriAddress(req),
        headers: req.getApiHeaders(),
      );
      callback(response);
    } on SocketException {
      errorCallback!.onSocketConnection();
    } on TimeoutException {
      errorCallback!.onTimeout();
    } catch (e) {
      errorCallback!.onFailed(e.toString());
    }
  }

  @override
  MethodType getMethod() {
    return MethodType.delete;
  }
}
