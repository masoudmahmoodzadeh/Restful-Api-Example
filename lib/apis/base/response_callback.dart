typedef OnSuccess<T> = Function(dynamic json);
typedef OnUnauthorized = Function();
typedef OnFailed = Function(int statusCode, String message);

class ResponseCallback<T> {
  final OnSuccess<T> onSuccess;
  final OnUnauthorized? onUnauthorized;
  final OnFailed? onFailed;

  ResponseCallback(
      {required this.onSuccess, this.onUnauthorized, this.onFailed});
}
