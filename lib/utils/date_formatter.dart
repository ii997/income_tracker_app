import 'package:intl/intl.dart';

class DateFormatter {
  static String format(DateTime date) {
    final now = DateTime.now();
    final localDate = date.toLocal();
    final difference = now.difference(localDate).inDays;

    if (isSameDay(localDate, now)) {
      return 'Today';
    } else if (isSameDay(localDate, now.subtract(const Duration(days: 1)))) {
      return 'Yesterday';
    } else if (difference < 7) {
      // If within the week → e.g. "Monday"
      return DateFormat('EEEE').format(localDate);
    } else if (localDate.year == now.year) {
      // Same year → "Oct 4"
      return DateFormat('MMM d').format(localDate);
    } else {
      // Different year → "Oct 4, 2024"
      return DateFormat('MMM d, yyyy').format(localDate);
    }
  }

  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
