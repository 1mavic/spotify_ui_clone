import 'package:flutter/material.dart';

/// Application theme class
class ApplicationThemeData {
  /// theme data
  static final theme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}
