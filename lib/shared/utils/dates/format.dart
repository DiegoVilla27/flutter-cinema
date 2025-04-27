import 'package:intl/intl.dart';

String formatDateWithPattern(DateTime date, String pattern) {
  return DateFormat(pattern).format(date);
}
