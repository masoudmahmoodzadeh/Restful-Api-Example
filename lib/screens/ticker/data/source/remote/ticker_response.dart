class TickerResponse {
  final String symbol;
  final String priceChange;
  final String priceChangePercent;
  final String prevClosePrice;
  final String lastPrice;
  final String bidPrice;
  final String bidQty;
  final String askPrice;
  final String askQty;
  final String openPrice;
  final String highPrice;
  final String lowPrice;
  final String volume;
  final String quoteVolume;


  TickerResponse(this.symbol, this.priceChange,this.priceChangePercent,this.prevClosePrice,
      this.lastPrice,this.bidPrice,this.bidQty,this.askPrice,this.askQty,this.openPrice,this.highPrice,this.lowPrice,this.quoteVolume,this.volume);

  factory TickerResponse.fromJson(Map<String, dynamic> json) {
    return TickerResponse(
      json['symbol'],
      json['priceChange'],
      json['priceChangePercent'],
      json['prevClosePrice'],
      json['lastPrice'],
      json['bidPrice'],
      json['bidQty'],
      json['askPrice'],
      json['askQty'],
      json['openPrice'],
      json['highPrice'],
      json['lowPrice'],
      json['volume'],
      json['quoteVolume']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "symbol": symbol,
      "priceChange": priceChange,
      "priceChangePercent" :priceChangePercent,
      "prevClosePrice" :prevClosePrice,
      "lastPrice" :lastPrice,
      "bidPrice":bidPrice,
      "bidQty":bidQty,
      "askPrice":askPrice,
      "askQty":askQty,
      "openPrice":openPrice,
      "highPrice":highPrice,
      "lowPrice":lowPrice,
      "volume":volume,
      "quoteVolume":quoteVolume,
    };
  }
}
