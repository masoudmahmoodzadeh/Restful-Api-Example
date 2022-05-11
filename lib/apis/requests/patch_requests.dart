import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';
import '../method_type.dart';
import 'http_request.dart';

import '../api_error_callback.dart';
import '../base_app_request.dart';
import 'http_request.dart';

class PatchRequests extends HttpRequest {
  @override
  void call(
      BaseAppRequest req, callback, ApiErrorCallback? errorCallback) async {
    try {
      var response = await patch(
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
    return MethodType.patch;
  }
}
