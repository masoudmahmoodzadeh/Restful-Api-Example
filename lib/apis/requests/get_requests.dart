import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';

import '../api_error_callback.dart';
import '../base_app_request.dart';
import '../method_type.dart';
import 'http_request.dart';

class GetRequests extends HttpRequest {
  @override
  void call(
      BaseAppRequest req, callback, ApiErrorCallback? errorCallback) async {
    try {
      var response = await get(
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
    return MethodType.get;
  }
}
