import 'package:intl/intl.dart';

String formatCurrency(double number, {int? decimalDigits, String? symbol}) {
  return NumberFormat.compactCurrency(
    decimalDigits: decimalDigits ?? 0,
    locale: 'en_US',
    symbol: symbol ?? '',
  ).format(number);
}
