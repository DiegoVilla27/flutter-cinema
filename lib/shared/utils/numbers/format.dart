import 'package:intl/intl.dart';

/// Formats a [double] number into a currency string.
///
/// This function uses the `NumberFormat.compactCurrency` class from the `intl` package to convert
/// a [double] into a compact currency format. It allows customization of the number of decimal
/// digits and the currency symbol.
///
/// Example usage:
/// ```dart
/// double amount = 1234567.89;
/// String formattedAmount = formatCurrency(amount, decimalDigits: 2, symbol: '\$');
/// print(formattedAmount);  // Output: $1.23M (if the amount is large enough)
/// ```
///
/// Parameters:
/// - [number]: The [double] number to be formatted.
/// - [decimalDigits] (optional): The number of decimal digits to display. Default is 0 if not provided.
/// - [symbol] (optional): The currency symbol to prepend. Default is an empty string if not provided.
///
/// Returns:
/// A [String] representing the formatted currency value.
String formatCurrency(double number, {int? decimalDigits, String? symbol}) {
  return NumberFormat.compactCurrency(
    decimalDigits: decimalDigits ?? 0,
    locale: 'en_US',
    symbol: symbol ?? '',
  ).format(number);
}
