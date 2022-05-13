import 'package:intl/intl.dart';

class CustomDateUtils {
  static String dateToFormattedString(DateTime date) {
    final DateFormat dateFormatter = DateFormat('EEEE, MMM d, hh:mm a');
    final String formattedDate = dateFormatter.format(date);
    return formattedDate;
  }
}
