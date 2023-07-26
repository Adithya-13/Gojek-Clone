import 'package:intl/intl.dart';

extension XDouble on double {
  /// [INFO]
  /// to convert from double to rupiah
  String toRupiah() {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return currencyFormatter.format(this);
  }
}
