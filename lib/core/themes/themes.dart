import 'package:flutter/material.dart';

class Themes {
  static final ThemeData lighTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.green,
      onPrimary: Colors.black,
      secondary: Colors.white,
      onSecondary: Colors.cyan,
      error: Colors.red,
      onError: Colors.redAccent,
      surface: Colors.transparent,
      onSurface: Colors.grey,
    ),
  );
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.green,
      onPrimary: Colors.black,
      secondary: Colors.white,
      onSecondary: Colors.cyan,
      error: Colors.red,
      onError: Colors.redAccent,
      surface: Colors.transparent,
      onSurface: Colors.grey,
    ),
  );
}
