import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
    useMaterial3: true,
  );

  static Color appBarBackground(BuildContext context) =>
      Theme.of(context).colorScheme.inversePrimary;
}
