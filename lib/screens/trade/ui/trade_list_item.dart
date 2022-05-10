import 'package:flutter/material.dart';

import '../data/source/remote/list_trade_response.dart';

class TradeListItem extends StatelessWidget {
  final ListTradeResponse item;

  const TradeListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _buildLabel("Qty"),
                      const SizedBox(height: 8),
                      _buildValue(item.qty),
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    _buildLabel("QuoteQty"),
                    const SizedBox(height: 8),
                    _buildValue(item.quoteQty),
                  ],
                ))
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _buildLabel("Price"),
                      const SizedBox(height: 8),
                      _buildValue(item.price),
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    _buildLabel("Time"),
                    const SizedBox(height: 8),
                    _buildValue(item.getTime()),
                  ],
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: const TextStyle(color: Colors.grey, fontSize: 12),
    );
  }

  Widget _buildValue(String value) {
    return Text(
      value,
      style: const TextStyle(color: Colors.white),
    );
  }
}
