import 'package:intl/intl.dart';

class ServiceUtils {
  static String formatDateStr(String dateStr) {
    var format = "dd-MM-yyyy";
    if (dateStr != "") {
      DateTime tempDate = DateTime.parse(dateStr);
      String dateResponse = DateFormat(format).format(tempDate);
      return dateResponse;
    } else
      return "";
  }

  static String formatDateYMD(String dateStr) {
    var format = "yyyy-MM-dd";
    if (dateStr != "") {
      DateTime tempDate = DateTime.parse(dateStr);
      String dateResponse = DateFormat(format).format(tempDate);
      return dateResponse;
    } else
      return "";
  }
}