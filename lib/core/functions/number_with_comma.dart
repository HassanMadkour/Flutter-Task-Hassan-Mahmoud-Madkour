import 'package:intl/intl.dart';

String formatWithCommas(double number) {
  final formatter = NumberFormat('#,###');
  return formatter.format(number);
}
