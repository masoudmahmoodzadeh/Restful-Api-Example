import 'package:date_format/date_format.dart';

class ListTradeResponse {
  final int id;
  final String price;
  final String qty;
  final String quoteQty;
  final int time;
  final bool isBuyerMaker;
  final bool isBestMatch;

  ListTradeResponse(this.id, this.price, this.qty, this.quoteQty, this.time,
      this.isBuyerMaker, this.isBestMatch);

  factory ListTradeResponse.fromJson(Map<String, dynamic> json) {
    return ListTradeResponse(
      json['id'],
      json['price'],
      json['qty'],
      json['quoteQty'],
      json['time'],
      json['isBuyerMaker'],
      json['isBestMatch'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'qty': qty,
        'quoteQty': quoteQty,
        'time': time,
        'isBuyerMaker': isBuyerMaker,
        'isBestMatch': isBestMatch,
      };

  String getTime() {
    return formatDate(DateTime.fromMicrosecondsSinceEpoch(time * 1000), [
      yyyy,
      '-',
      mm,
      '-',
      dd,
      ' ',
      HH,
      ':',
      nn,
    ]);
  }
}
