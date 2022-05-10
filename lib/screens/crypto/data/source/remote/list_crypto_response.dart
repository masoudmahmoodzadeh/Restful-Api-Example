class ListCryptoResponse {
  final String symbol;
  final String price;

  ListCryptoResponse(this.symbol, this.price);

  factory ListCryptoResponse.fromJson(Map<String, dynamic> json) {
    return ListCryptoResponse(
      json['symbol'],
      json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "symbol": symbol,
      "price": price,
    };
  }
}
