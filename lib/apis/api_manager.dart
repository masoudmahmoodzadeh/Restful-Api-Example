import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'base_app_request.dart';
import 'requests/delete_requests.dart';
import 'requests/get_params_requests.dart';
import 'requests/get_requests.dart';
import 'requests/http_request.dart';
import 'requests/patch_requests.dart';
import 'requests/post_requests.dart';
import 'requests/put_requests.dart';
import 'response_callback.dart';


class ApiManager {
  void sendRequest(BaseAppRequest request, ResponseCallback callback) async {
    HttpRequest httpRequest = _requests
        .firstWhere((element) => element.getMethod() == request.getApiMethod());
    httpRequest.call(request, (Response httpResponse) {
      try {
        if (httpResponse.statusCode >= 200 && httpResponse.statusCode < 300) {
          var json = jsonDecode(httpResponse.body);
          callback.onSuccess(json);
        }
        //Unauthorized
        else if (httpResponse.statusCode == 401) {
          log("onUnauthorized");
          callback.onUnauthorized;
        }
        //Failed
        else {
          log("onFailed => statusCode : " +
              httpResponse.statusCode.toString() +
              " message : " +
              httpResponse.body);

          callback.onFailed!(httpResponse.statusCode, httpResponse.body);
        }
      } catch (e) {
        log(e.toString());
        callback.onFailed!(httpResponse.statusCode, e.toString());
      }
    });
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
}
