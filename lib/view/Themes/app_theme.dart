import 'package:flutter/material.dart';

class AppTheme {
  static const Color _primaryColor =
      Color(0xFFE3E0E7); // Color(0xFF0626A9); //Color.fromARGB(255, 6, 38, 169); //Color(0xFF364B9C); 0x0626A9
  // Color.fromARGB(255, 6, 38, 169); //Color(0xFF364B9C); 0x0626A9
  static const Color _secondaryColor = Color(0xFF0626A9);
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
          onPrimary: _secondaryColor,
          onSecondary: _primaryColor),
      scaffoldBackgroundColor: _primaryColor, // Fondo del Scaffold
      appBarTheme: appBarTheme.copyWith(backgroundColor: _primaryColor),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: _secondaryColor, fontFamily: 'GalaxyBt'),
        bodyMedium: TextStyle(color: _secondaryColor, fontFamily: 'GalaxyBt'),
        bodySmall: TextStyle(color: _secondaryColor, fontFamily: 'GalaxyBt'),
        displayLarge: TextStyle(color: _secondaryColor, fontFamily: 'GalaxyBt'),
        displayMedium: TextStyle(color: _secondaryColor, fontFamily: 'GalaxyBt'),
        displaySmall: TextStyle(color: _secondaryColor, fontFamily: 'GalaxyBt'),
        headlineLarge: TextStyle(color: _secondaryColor, fontFamily: 'GalaxyBt'),
        headlineMedium: TextStyle(color: _secondaryColor, fontFamily: 'GalaxyBt'),
        headlineSmall: TextStyle(color: _secondaryColor, fontFamily: 'GalaxyBt'),
        labelLarge: TextStyle(color: _secondaryColor, fontFamily: 'GalaxyBt'),
        labelMedium: TextStyle(color: _secondaryColor, fontFamily: 'GalaxyBt'),
        labelSmall: TextStyle(color: _secondaryColor, fontFamily: 'GalaxyBt'),
        titleLarge: TextStyle(color: _secondaryColor, fontFamily: 'GalaxyBt'),
        titleMedium: TextStyle(color: _secondaryColor, fontFamily: 'GalaxyBt'),
        titleSmall: TextStyle(color: _secondaryColor, fontFamily: 'GalaxyBt'),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.lightBlueAccent,
        selectionHandleColor: Colors.blue,
        cursorColor: Colors.red,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _secondaryColor,

          // primary: _primaryColor, // Color de fondo del botón
          // onPrimary: Colors.white, // Color del texto del botón
          textStyle: const TextStyle(
            fontSize: 20,
            fontFamily: 'Calibri',
            fontFamilyFallback: ['Roboto'],
            color: _primaryColor,
          ),
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: Colors.black,
        ),
      ),
      useMaterial3: true,
      canvasColor: _secondaryColor);
}
