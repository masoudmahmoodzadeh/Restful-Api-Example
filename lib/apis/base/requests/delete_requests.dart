import 'package:http/http.dart';
import 'package:restful_api_example/apis/base/method_type.dart';
import 'package:restful_api_example/apis/base/requests/http_request.dart';

import '../base_app_request.dart';

class DeleteRequests extends HttpRequest {
  @override
  void call(BaseAppRequest req, callback) async {
    var response = await delete(
      getUriAddress(req),
      headers: req.getApiHeaders(),
    );
    callback(response);
  }

  @override
  MethodType getMethod() {
    return MethodType.delete;
  }
}
