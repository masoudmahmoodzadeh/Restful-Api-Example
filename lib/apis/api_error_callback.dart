typedef OnBadRequest = Function(String error);
typedef OnUnauthorized = Function();
typedef OnServerError = Function(int statusCode);
typedef OnSocketConnection = Function();
typedef OnTimeout = Function();
typedef OnFailed = Function(String message);

class ApiErrorCallback {
  final OnBadRequest onBadRequest;
  final OnUnauthorized onUnauthorized;
  final OnServerError onServerError;
  final OnSocketConnection onSocketConnection;
  final OnTimeout onTimeout;
  final OnFailed onFailed;

  ApiErrorCallback({
    required this.onBadRequest,
    required this.onUnauthorized,
    required this.onServerError,
    required this.onSocketConnection,
    required this.onTimeout,
    required this.onFailed,
  });
}
