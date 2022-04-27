import 'package:intl/intl.dart';

String prettyPrintTime(DateTime time, {bool? showTime, bool? showYear}) {
  var formatString = StringBuffer();
  if (showTime != null && showTime) formatString.write('HH:mm ');
  formatString.write('dd/MM');
  if (showYear != null && showYear) formatString.write('/yyyy');
  return DateFormat(formatString.toString()).format(time);
}
