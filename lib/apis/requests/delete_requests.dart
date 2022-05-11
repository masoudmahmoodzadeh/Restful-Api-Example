import 'package:http/http.dart';
import '../method_type.dart';
import 'http_request.dart';

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
