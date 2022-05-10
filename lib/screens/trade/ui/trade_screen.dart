import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restful_api_example/screens/crypto/data/source/remote/list_crypto_response.dart';
import 'package:restful_api_example/screens/trade/data/source/remote/list_trade_response.dart';
import 'package:restful_api_example/screens/trade/ui/trade_controller.dart';
import 'package:restful_api_example/screens/trade/ui/trade_list_item.dart';

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
        title: Text(crypto.symbol),
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
                    return TradeListItem(item: item);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      color: Colors.transparent,
                      thickness: 1,
                    );
                  },
                ),
        ),
      ),
    );
  }
}
