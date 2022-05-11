import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';
import 'package:restful_api_example/apis/method_type.dart';

import '../api_error_callback.dart';
import '../base_app_request.dart';
import 'http_request.dart';

class GetParamsRequests extends HttpRequest {
  @override
  void call(
      BaseAppRequest req, callback, ApiErrorCallback? errorCallback) async {
    final String _queryString = _createQuery(req);
    String url = req.getApiAddress() + _queryString;
    Uri apiAddress = generateApiAddressWithParams(url);
    try {
      var response = await get(apiAddress, headers: req.getApiHeaders());
      callback(response);
    } on SocketException {
      errorCallback!.onSocketConnection();
    } on TimeoutException {
      errorCallback!.onTimeout();
    } catch (e) {
      errorCallback!.onFailed(e.toString());
    }
  }

  String _createQuery(BaseAppRequest req) {
    return _generateQueryString(req.toJson());
  }

  String _generateQueryString(Map<String, dynamic> query) {
    return "?" +
        Uri(
            queryParameters: query
                .map((key, value) => MapEntry(key, value?.toString()))).query;
  }

  @override
  MethodType getMethod() {
    return MethodType.getQueryString;
  }
}
