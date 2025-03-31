import 'package:flutter/material.dart';

class AppTheme {
  static const Color _primaryColor = Color(
      0xFF0626A9); //Color.fromARGB(255, 6, 38, 169); //Color(0xFF364B9C); 0x0626A9
  // Color.fromARGB(255, 6, 38, 169); //Color(0xFF364B9C); 0x0626A9
  static const Color _secondaryColor = Color(0xFFE3E0E7);
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
      bodyLarge: TextStyle(color: Colors.white, fontFamily: 'GalaxyBt'),
      bodyMedium: TextStyle(color: Colors.white, fontFamily: 'GalaxyBt'),
      bodySmall: TextStyle(color: Colors.white, fontFamily: 'GalaxyBt'),
      displayLarge: TextStyle(color: Colors.white, fontFamily: 'GalaxyBt'),
      displayMedium: TextStyle(color: Colors.white, fontFamily: 'GalaxyBt'),
      displaySmall: TextStyle(color: Colors.white, fontFamily: 'GalaxyBt'),
      headlineLarge: TextStyle(color: Colors.white, fontFamily: 'GalaxyBt'),
      headlineMedium: TextStyle(color: Colors.white, fontFamily: 'GalaxyBt'),
      headlineSmall: TextStyle(color: Colors.white, fontFamily: 'GalaxyBt'),
      labelLarge: TextStyle(color: Colors.white, fontFamily: 'GalaxyBt'),
      labelMedium: TextStyle(color: Colors.white, fontFamily: 'GalaxyBt'),
      labelSmall: TextStyle(color: Colors.white, fontFamily: 'GalaxyBt'),
      titleLarge: TextStyle(color: Colors.white, fontFamily: 'GalaxyBt'),
      titleMedium: TextStyle(color: Colors.white, fontFamily: 'GalaxyBt'),
      titleSmall: TextStyle(color: Colors.white, fontFamily: 'GalaxyBt'),
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
