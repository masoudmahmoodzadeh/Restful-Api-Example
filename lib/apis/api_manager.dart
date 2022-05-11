import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'api_error_callback.dart';
import 'base_app_request.dart';
import 'requests/delete_requests.dart';
import 'requests/get_params_requests.dart';
import 'requests/get_requests.dart';
import 'requests/http_request.dart';
import 'requests/patch_requests.dart';
import 'requests/post_requests.dart';
import 'requests/put_requests.dart';

class ApiManager {
  void sendRequest({
    required BaseAppRequest request,
    required OnSuccess onSuccess,
    ApiErrorCallback? errorCallback,
  }) async {
    HttpRequest httpRequest = _requests
        .firstWhere((element) => element.getMethod() == request.getApiMethod());
    httpRequest.call(
      request,
      (Response httpResponse) {
        if (_isSuccessful(httpResponse)) {
          var json = jsonDecode(httpResponse.body);
          onSuccess(json);
        } else if (_isBadRequest(httpResponse)) {
          errorCallback!.onBadRequest(json.toString());
        } else if (_isUnAuthorized(httpResponse)) {
          errorCallback!.onUnauthorized();
        } else if (_isServerError(httpResponse)) {
          errorCallback!.onServerError(httpResponse.statusCode);
        } else {
          errorCallback!.onFailed(httpResponse.body);
        }
      },
      errorCallback,
    );
  }

  void log(String message) => kDebugMode ? print(message) : null;

  final List<HttpRequest> _requests = [
    GetRequests(),
    PostRequests(),
    GetParamsRequests(),
    DeleteRequests(),
    PatchRequests(),
    PutRequests()
  ];

  bool _isSuccessful(Response httpResponse) {
    return httpResponse.statusCode >= 200 && httpResponse.statusCode < 300;
  }

  bool _isBadRequest(Response httpResponse) {
    return httpResponse.statusCode == 400;
  }

  bool _isUnAuthorized(Response httpResponse) {
    return httpResponse.statusCode == 401;
  }

  bool _isServerError(Response httpResponse) {
    return httpResponse.statusCode >= 500 && httpResponse.statusCode < 600;
  }
}

typedef OnSuccess = Function(dynamic json);

typedef OnResponseApi = Function(Response httpResponse);
