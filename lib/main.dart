import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restful_api_example/screens/app_routes.dart';
import 'package:restful_api_example/utils/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Restful Api Example',
      theme: ThemeManager().create(),
      initialRoute: AppRoutes.listCrypto,
      getPages: AppRoutes().routes(),
    );
  }
}
