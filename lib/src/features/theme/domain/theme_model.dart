import 'package:flutter/material.dart';

class ThemeModel {
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  ThemeMode? currTheme = ThemeMode.dark;

  ThemeModel({
    required this.lightTheme,
    required this.darkTheme,
    this.currTheme,
  });

  ThemeModel copyWith({
    ThemeData? lTheme,
    ThemeData? dTheme,
    ThemeMode? mode,
  }) {
    return ThemeModel(
        lightTheme: lTheme ?? lightTheme,
        darkTheme: dTheme ?? darkTheme,
        currTheme: mode ?? currTheme);
  }
}
