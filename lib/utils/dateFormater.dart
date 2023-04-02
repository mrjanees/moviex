import 'package:intl/intl.dart';

String dateFormater(String date) {
  final dateForm = DateFormat.MMMMd('en_US').format(DateTime.parse(date));
  final month = dateForm.split(' ').first.substring(0, 3);
  final day = date.split('-')[2];
  return '$month $day';
}

String searchCardDate(String date) {
  final dateForm = DateFormat.yMMMMd('en_US').format(DateTime.parse(date));

  final month = dateForm.split(' ').first.substring(0, 3);
  final day = date.split('-')[2];
  final year = date.split('-')[0];

  return '$month $day, $year';
}
