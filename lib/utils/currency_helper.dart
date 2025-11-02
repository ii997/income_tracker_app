import 'package:intl/intl.dart';

class CurrencyHelper {
  // Default: Philippine Peso (₱). You can adjust `locale` and `symbol` as needed.
  static String format(
    double amount, {
    String locale = 'en_PH',
    String symbol = '₱',
  }) {
    final formatter = NumberFormat.compactCurrency(
      locale: locale,
      symbol: symbol,
      decimalDigits: 2, // Change if you want whole numbers only
    );
    return formatter.format(amount);
  }

  // Optional: Parse back from string to double (if needed)
  static double parse(String formatted, {String symbol = '₱'}) {
    final cleaned = formatted.replaceAll(symbol, '').replaceAll(',', '').trim();
    return double.tryParse(cleaned) ?? 0.0;
  }
}
