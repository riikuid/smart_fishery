import 'package:dependencies/intl.dart';

abstract class DateFormatter {
  static String getDMY(DateTime dateTime){
    return DateFormat.yMMMd().format(dateTime);
  }

}