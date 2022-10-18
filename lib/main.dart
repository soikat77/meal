import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';

import 'package:meal/pages/homepage.dart';
import 'package:meal/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: ((ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.llightTheme(lightDynamic),
          darkTheme: AppTheme.darkTheme(darkDynamic),
          // Home/ROOT
          home: const HomePage(),
        );
      }),
    );
  }
}
