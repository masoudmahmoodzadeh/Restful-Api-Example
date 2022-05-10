import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restful_api_example/screens/crypto/ui/crypto_controller.dart';
import 'package:restful_api_example/screens/crypto/ui/crypto_list_item.dart';

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
                    return CryptoListItem(item: item);
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
