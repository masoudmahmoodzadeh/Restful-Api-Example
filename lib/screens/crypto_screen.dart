import 'package:flutter/material.dart';
import 'package:restful_api_example/screens/trade/trade_screen.dart';

import '../apis/base/api_manager.dart';
import '../apis/base/response_callback.dart';
import '../apis/list_crypto/list_crypto_request.dart';
import '../apis/list_crypto/list_crypto_response.dart';

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({Key? key}) : super(key: key);

  @override
  _CryptoScreenState createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  List<ListCryptoResponse> listCrypto = [];

  @override
  void initState() {
    _getListCrypto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restful Api Example"),
      ),
      body: Center(
        child: listCrypto.isEmpty
            ? const CircularProgressIndicator()
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: listCrypto.length,
                itemBuilder: (context, index) {
                  ListCryptoResponse item = listCrypto[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return TradeScreen(
                            crypto: item,
                          );
                        },
                      ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.symbol),
                        const SizedBox(height: 16),
                        Text(item.price),
                      ],
                    ),
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

  void _getListCrypto() {
    ApiManager apiManager = ApiManager();
    apiManager.sendRequest(ListCryptoRequest(),
        ResponseCallback<List<ListCryptoResponse>>(
      onSuccess: ((json) {
        List<ListCryptoResponse> data = (json as List)
            .map((item) => ListCryptoResponse.fromJson(item))
            .toList();

        setState(() {
          listCrypto = data;
        });
      }),
    ));
  }
}
