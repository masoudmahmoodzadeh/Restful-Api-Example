import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restful_api_example/utils/drawable_manager.dart';

import '../../../base/base_colors.dart';
import '../../app_routes.dart';
import '../data/source/remote/list_crypto_response.dart';

class CryptoListItem extends StatelessWidget {
  final ListCryptoResponse item;

  const CryptoListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.listTrade, arguments: item);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLogo(),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.symbol,
                            style: const TextStyle(
                              color: Colors.white,
                            )),
                        Text(item.price,
                            style: const TextStyle(
                              color: BaseColors.greenLight,
                            )),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Buy",
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                        Text("Today , 12:37 PM",
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return const Image(
      image: AssetImage(DrawableManager.icBitcoin),
      width: 50,
      height: 50,
    );
  }
}
