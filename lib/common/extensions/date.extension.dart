import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  bool isSameDate(DateTime other) => year == other.year && month == other.month && day == other.day;

  String toDayMonthAndYear() => DateFormat('EEEE d MMMM yyyy', 'FR').format(this);

  String toHourAndMinutes() => DateFormat('HH:mm', 'FR').format(this);
}
