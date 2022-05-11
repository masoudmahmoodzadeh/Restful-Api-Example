import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restful_api_example/base/base_colors.dart';
import 'package:restful_api_example/screens/ticker/ui/ticker_controller.dart';

import '../../../base/custom_app_bar.dart';
import '../../crypto/data/source/remote/list_crypto_response.dart';

class TickerScreen extends StatelessWidget {
  final controller = Get.find<TickerController>();

  TickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListCryptoResponse crypto =
        ModalRoute.of(context)!.settings.arguments as ListCryptoResponse;
    controller.crypto = crypto;

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: "Ticker"),
        body: Obx(
          () => controller.isLoading()
              ? const Center(child: CircularProgressIndicator())
              : Padding(
            padding: const EdgeInsets.all(16),
                child: Container(
                    decoration: BoxDecoration(
                      color: BaseColors.primary,
                      border: Border.all(
                        color: Colors.amber,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: Get.width,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            controller.ticker.value!.priceChangePercent,
                            style:
                                const TextStyle(fontSize: 12, color: Colors.red),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            controller.ticker.value!.priceChange,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.green),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            controller.ticker.value!.volume,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.yellow),
                          )
                        ],
                      ),
                    ),
                  ),
              ),
        ),
      ),
    );
  }
}
