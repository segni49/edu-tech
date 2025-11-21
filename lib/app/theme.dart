import 'package:flutter/material.dart';

const int _seedColor = 0xFF2E7D32;

final ColorScheme lightColorScheme = ColorScheme.fromSeed(
  seedColor: Color(_seedColor),
  brightness: Brightness.light,
);

final ColorScheme darkColorScheme = ColorScheme.fromSeed(
  seedColor: Color(_seedColor),
  brightness: Brightness.dark,
);

final ThemeData lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  useMaterial3: true,
  brightness: Brightness.light,
  textTheme: Typography.blackMountainView,
);

final ThemeData darkTheme = ThemeData(
  colorScheme: darkColorScheme,
  useMaterial3: true,
  brightness: Brightness.dark,
  textTheme: Typography.whiteMountainView,
);
