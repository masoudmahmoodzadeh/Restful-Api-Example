import 'package:http/http.dart';
import '../method_type.dart';

import '../base_app_request.dart';
import 'http_request.dart';

class GetRequests extends HttpRequest {
  @override
  void call(BaseAppRequest req, callback) async {
    var response = await get(
      getUriAddress(req),
      headers: req.getApiHeaders(),
    );
    callback(response);
  }

  @override
  MethodType getMethod() {
    return MethodType.get;
  }
}
