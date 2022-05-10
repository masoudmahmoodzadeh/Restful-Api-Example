import 'package:flutter/material.dart';
import 'package:restful_api_example/base/base_colors.dart';
import 'package:restful_api_example/screens/crypto/ui/crypto_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restful Api Example',
      theme: ThemeData(
        scaffoldBackgroundColor: BaseColors.primary,
        cardTheme: CardTheme(
          color: BaseColors.card,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const CryptoScreen(),
    );
  }
}
