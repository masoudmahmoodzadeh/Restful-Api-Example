import 'package:flutter/material.dart';
import 'package:restful_api_example/screens/crypto/data/source/remote/list_crypto_response.dart';
import 'package:restful_api_example/screens/trade/data/source/remote/list_trade_request.dart';
import 'package:restful_api_example/screens/trade/data/source/remote/list_trade_response.dart';

import '../../../apis/api_manager.dart';
import '../../../apis/response_callback.dart';

class TradeScreen extends StatefulWidget {
  final ListCryptoResponse crypto;

  const TradeScreen({Key? key, required this.crypto}) : super(key: key);

  @override
  _TradeScreenState createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  List<ListTradeResponse> listTrade = [];

  @override
  void initState() {
    _getListTrade(widget.crypto);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trades"),
      ),
      body: Center(
        child: listTrade.isEmpty
            ? const CircularProgressIndicator()
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: listTrade.length,
                itemBuilder: (context, index) {
                  ListTradeResponse item = listTrade[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.time.toString()),
                      const SizedBox(height: 16),
                      Text(item.price),
                      const SizedBox(height: 16),
                      Text(item.qty),
                      const SizedBox(height: 16),
                      Text(item.quoteQty),
                      const SizedBox(height: 16),
                      Text(item.isBuyerMaker.toString()),
                      const SizedBox(height: 16),
                      Text(item.isBestMatch.toString()),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.blue,
                    thickness: 1,
                  );
                },
              ),
      ),
    );
  }

  void _getListTrade(ListCryptoResponse? crypto) {
    ApiManager apiManager = ApiManager();
    apiManager.sendRequest(ListTradeRequest(crypto!.symbol, 100),
        ResponseCallback<List<ListCryptoResponse>>(
      onSuccess: ((json) {
        List<ListTradeResponse> data = (json as List)
            .map((item) => ListTradeResponse.fromJson(item))
            .toList();

        setState(() {
          listTrade = data;
        });
      }),
    ));
  }
}
