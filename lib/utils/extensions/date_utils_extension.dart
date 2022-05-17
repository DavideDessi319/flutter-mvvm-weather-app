import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateUtilsExtension on DateUtils {
  static String timestampToFormattedString(int timestamp) {
    final DateFormat dateFormatter = DateFormat('EEEE, MMM d, hh:mm a');
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final String formattedDate = dateFormatter.format(date);
    return formattedDate;
  }

  static String timestampToDayOfWeek(int timestamp) {
    final DateFormat dateFormatter = DateFormat('EEEE');
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final String formattedDate = dateFormatter.format(date);
    return formattedDate;
  }

  static String timestampToStringDate(int timestamp) {
    final DateFormat dateFormatter = DateFormat('dd/mm/yyyy');
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final String formattedDate = dateFormatter.format(date);
    return formattedDate;
  }
}
