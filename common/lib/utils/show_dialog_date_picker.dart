import 'package:common/utils/date_formatter.dart';
import 'package:flutter/material.dart';

Future<String?> showDialogDatePicker(BuildContext context) async {
  final choosenDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now().add(const Duration(days: -365 * 10)),
    lastDate: DateTime.now().add(const Duration(days: 365 * 50))
  );

  if (choosenDate != null){
    return DateFormatter.getDMY(choosenDate);
  }
  else {
    return null;
  }
}