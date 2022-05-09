import 'package:flutter/material.dart';
import 'package:restful_api_example/base/base_colors.dart';
import 'package:restful_api_example/screens/trade_screen.dart';

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
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: BaseColors.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.ac_unit,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(item.symbol,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      )),
                                  const SizedBox(height: 16),
                                  Text(item.price,
                                      style: const TextStyle(
                                        color: BaseColors.greenLight,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.transparent,
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
