
import 'package:intl/intl.dart';

class AppFormat{
  static String formatDate(DateTime date) {
    final datePart = DateFormat('MMM dd, yyyy').format(date);
    final timePart = DateFormat('hh.mm a').format(date);
    return '$datePart | $timePart';
  }

}