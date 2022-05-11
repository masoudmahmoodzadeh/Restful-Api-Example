import 'package:http/http.dart';
import '../method_type.dart';
import 'http_request.dart';

import '../base_app_request.dart';

class PutRequests extends HttpRequest {
  @override
  void call(BaseAppRequest req, callback) async {
    var response = await put(
      getUriAddress(req),
      headers: req.getApiHeaders(),
    );
    callback(response);
  }

  @override
  MethodType getMethod() {
    return MethodType.put;
  }
}
