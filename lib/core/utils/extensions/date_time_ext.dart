import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String get formatted => DateFormat.yMMMMd().format(this);
}
