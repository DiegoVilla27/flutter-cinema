import 'package:flutter/material.dart';
import 'package:flutter_cinema/core/theme/app_theme_colors.dart';

class AppTheme {
  final bool isDarkMode;
  final EColorsType selectedColor;

  AppTheme({
    this.isDarkMode = true,
    this.selectedColor = EColorsType.deepPurpleAccent,
  });

  /// Returns a [ThemeData] object configured with the selected color scheme
  /// and brightness mode.
  ///
  /// The color scheme is determined by the `selectedColor` from the
  /// `colorsTheme` map, and the brightness is set based on the `isDarkMode`
  /// flag.
  ThemeData get() {
    return ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorsTheme[selectedColor]!.color,
    );
  }

  /// Creates a copy of the current `AppTheme` instance with the option to
  /// override the `isDarkMode` and `selectedColor` properties.
  ///
  /// Returns a new `AppTheme` instance with updated properties.
  AppTheme copyWith({bool? isDarkMode, EColorsType? selectedColor}) {
    return AppTheme(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }
}
