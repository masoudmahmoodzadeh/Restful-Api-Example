import 'package:http/http.dart';
import 'package:restful_api_example/apis/base/method_type.dart';
import 'package:restful_api_example/apis/base/requests/http_request.dart';

import '../base_app_request.dart';

class GetParamsRequests extends HttpRequest {
  @override
  void call(BaseAppRequest req, callback) async {
    final String _queryString = _createQuery(req);
    String url = req.getApiAddress() + _queryString;
    Uri apiAddress = generateApiAddressWithParams(url);
    var response = await get(apiAddress, headers: req.getApiHeaders());
    callback(response);
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
