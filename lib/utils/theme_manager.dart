import 'package:flutter/material.dart';

import '../base/base_colors.dart';

class ThemeManager {
  ThemeData create() {
    return ThemeData(
      scaffoldBackgroundColor: BaseColors.primary,
      cardTheme: CardTheme(
        color: BaseColors.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      primarySwatch: Colors.blue,
    );
  }
}
