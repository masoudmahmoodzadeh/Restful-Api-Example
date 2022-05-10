import '../../../../../apis/base_app_request.dart';
import '../../../../../apis/method_type.dart';

class ListTradeRequest extends BaseAppRequest {
  final String symbol;
  final int limit;

  ListTradeRequest(this.symbol, this.limit);

  @override
  MethodType getApiMethod() {
    return MethodType.getQueryString;
  }

  @override
  String getApiAddress() {
    return "/api/v3/trades";
  }

  @override
  ListTradeRequest fromJson(Map<String, dynamic> json) {
    return ListTradeRequest(
      json['symbol'],
      json['limit'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'limit': limit,
      };
}
