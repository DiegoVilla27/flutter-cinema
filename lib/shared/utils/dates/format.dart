import 'package:intl/intl.dart';

/// Formats a [DateTime] object into a string using a custom pattern.
///
/// This function uses the `DateFormat` class from the `intl` package to convert a [DateTime] object
/// into a string representation based on the specified [pattern]. The pattern defines the format
/// of the output string (e.g., "yyyy-MM-dd", "dd/MM/yyyy", etc.).
///
/// Example usage:
/// ```dart
/// DateTime date = DateTime.now();
/// String formattedDate = formatDateWithPattern(date, 'dd/MM/yyyy');
/// print(formattedDate);  // Output: 02/05/2025 (or current date in specified format)
/// ```
///
/// Parameters:
/// - [date]: The [DateTime] object to be formatted.
/// - [pattern]: The pattern string used to format the date, e.g., "yyyy-MM-dd".
///
/// Returns:
/// A [String] representing the formatted date.
String formatDateWithPattern(DateTime date, String pattern) {
  return DateFormat(pattern).format(date);
}
