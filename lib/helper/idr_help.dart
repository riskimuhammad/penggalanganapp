import 'package:intl/intl.dart';

// ignore: non_constant_identifier_names
String IDR(value) {
  var data = NumberFormat.currency(
    locale: "id",
    symbol: "Rp. ",
  ).format(value);
  return data;
}
