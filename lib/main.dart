import 'package:flutter/material.dart';
import 'package:restful_api_example/screens/crypto_screen.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const CryptoScreen(),
    );
  }
}
