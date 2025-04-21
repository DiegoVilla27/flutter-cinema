import 'package:flutter/material.dart';

/// An enumeration of color types used in the application.
///
/// This enum defines a set of color types that can be used to
/// categorize and access different color themes within the app.
enum EColorsType { deepPurpleAccent, blue, teal, green, yellow, orange, pink }

/// A model class representing a theme color with a name and a color value.
///
/// This class is used to encapsulate the properties of a theme color,
/// including its display name and the associated color value.
class ColorTheme {
  final String name;
  final Color color;

  ColorTheme({required this.name, required this.color});
}

/// A map associating each EColorsType with its corresponding ColorTheme.
///
/// This map provides a convenient way to access predefined color themes
/// by their type, each containing a display name and a color value.
final Map<EColorsType, ColorTheme> colorsTheme = {
  EColorsType.deepPurpleAccent: ColorTheme(
    name: 'Deep Purple Accent',
    color: Colors.deepPurpleAccent,
  ),
  EColorsType.blue: ColorTheme(name: 'Blue', color: Colors.blue),
  EColorsType.teal: ColorTheme(name: 'Teal', color: Colors.teal),
  EColorsType.green: ColorTheme(name: 'Green', color: Colors.green),
  EColorsType.yellow: ColorTheme(name: 'Yellow', color: Colors.yellow),
  EColorsType.orange: ColorTheme(name: 'Orange', color: Colors.orange),
  EColorsType.pink: ColorTheme(name: 'Pink', color: Colors.pink),
};
