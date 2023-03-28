// Packages
import 'package:flutter/material.dart';

// Constants
import 'package:recipes/src/presentation/global/constants.dart';

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor.withOpacity(0.5)),
    borderRadius: BorderRadius.circular(5.0),
  );

  OutlineInputBorder outlineInputBorderError = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  );

  return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      enabledBorder: outlineInputBorder,
      disabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      errorBorder: outlineInputBorderError,
      focusedErrorBorder: outlineInputBorderError,
      hintStyle: const TextStyle(color: Colors.grey));
}

ThemeData themeLight = ThemeData.light().copyWith(
  primaryColor: primaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: primaryColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  ),
  inputDecorationTheme: inputDecorationTheme(),
);
