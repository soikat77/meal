import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData llightTheme(ColorScheme? lightDynamic) {
    ColorScheme scheme = lightDynamic ??
        ColorScheme.fromSeed(
          seedColor: const Color(0xFFF47C7C),
        );
    return ThemeData(
      colorScheme: scheme,
      useMaterial3: true,
    );
  }

  static ThemeData darkTheme(ColorScheme? darkDynamic) {
    ColorScheme scheme = darkDynamic ??
        ColorScheme.fromSeed(
          seedColor: const Color(0xFFF47C7C),
          brightness: Brightness.dark,
        );
    return ThemeData(
      colorScheme: scheme,
      useMaterial3: true,
    );
  }
}
