import 'package:flutter/material.dart';

class AppTheme {
  static const Color _primaryColor =
      Color.fromARGB(255, 6, 38, 169); //Color(0xFF364B9C);
  static const Color _secondaryColor = Colors.orange;
  static const Color _errorColor = Colors.red;

  static const appBarTheme = AppBarTheme(
      backgroundColor: _primaryColor,
      foregroundColor: Colors.white,
      centerTitle: false,
      elevation: 0, 
    );

  // Tema claro
  static final ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: _primaryColor,
      secondary: _secondaryColor,
      error: _errorColor,
      surface: _primaryColor, // Superficie del fondo
    ),
    scaffoldBackgroundColor: _primaryColor, // Fondo del Scaffold
    appBarTheme: appBarTheme.copyWith(backgroundColor: _primaryColor),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
      displayLarge: TextStyle(color: Colors.white),
      displayMedium: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),
      headlineLarge: TextStyle(color: Colors.white),
      headlineMedium: TextStyle(color: Colors.white),
      headlineSmall: TextStyle(color: Colors.white),
      labelLarge: TextStyle(color: Colors.white),
      labelMedium: TextStyle(color: Colors.white),
      labelSmall: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryColor,

        // primary: _primaryColor, // Color de fondo del botón
        // onPrimary: Colors.white, // Color del texto del botón
        textStyle: const TextStyle(
            fontSize: 20,
            fontFamily: 'Calibri',
            fontFamilyFallback: ['Roboto'],
            color: _primaryColor),
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.black,
      ),
    ),
    useMaterial3: true,
  );

}
