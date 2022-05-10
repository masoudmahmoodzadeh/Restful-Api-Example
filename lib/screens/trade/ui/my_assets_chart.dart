import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../base/base_colors.dart';

class MyAssetsChart extends StatelessWidget {
  const MyAssetsChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "BTC": 2.2,
      "ETH": 2.2,
      "BNB": 2.2,
      "TRX": 2.2,
    };

    final colorList = <Color>[
      const Color(0xFFfeb800),
      const Color(0xFFab71f8),
      const Color(0xFF3ffeb9),
      const Color(0xFF0543e2),
    ];

    return PieChart(
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 3000),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 2,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      centerText: "My Assets",
      centerTextStyle: const TextStyle(
        color: BaseColors.greenLight,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      legendOptions: const LegendOptions(
        showLegendsInRow: true,
        legendPosition: LegendPosition.bottom,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(color: Colors.white),
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: false,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
    );
  }
}
