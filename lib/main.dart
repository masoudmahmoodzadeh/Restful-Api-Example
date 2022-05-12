import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base/root_binding.dart';
import 'screens/app_routes.dart';
import 'utils/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Restful Api Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager().create(),
      initialRoute: AppRoutes.listCrypto,
      initialBinding: RootBinding(),
      getPages: AppRoutes().routes(),
    );
  }
}
