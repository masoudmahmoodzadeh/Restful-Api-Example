import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restful_api_example/base/base_colors.dart';
import 'package:restful_api_example/screens/crypto/ui/crypto_controller.dart';

import '../../app_routes.dart';
import '../data/source/remote/list_crypto_response.dart';

class CryptoScreen extends StatelessWidget {
  final controller = Get.find<CryptoController>();

  CryptoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restful Api Example"),
      ),
      body: Obx(
        () => Center(
          child: controller.listCrypto.isEmpty
              ? const CircularProgressIndicator()
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.listCrypto.length,
                  itemBuilder: (context, index) {
                    ListCryptoResponse item = controller.listCrypto[index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.listTrade, arguments: item);
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
      ),
    );
  }
}
