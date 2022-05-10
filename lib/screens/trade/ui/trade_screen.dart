import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restful_api_example/screens/crypto/data/source/remote/list_crypto_response.dart';
import 'package:restful_api_example/screens/trade/data/source/remote/list_trade_response.dart';
import 'package:restful_api_example/screens/trade/ui/trade_controller.dart';

class TradeScreen extends StatelessWidget {
  final controller = Get.find<TradeController>();

  TradeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListCryptoResponse crypto =
        ModalRoute.of(context)!.settings.arguments as ListCryptoResponse;
    controller.crypto = crypto;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Trades"),
      ),
      body: Obx(
        () => Center(
          child: controller.listTrade.isEmpty
              ? const CircularProgressIndicator()
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.listTrade.length,
                  itemBuilder: (context, index) {
                    ListTradeResponse item = controller.listTrade[index];
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
      ),
    );
  }
}
