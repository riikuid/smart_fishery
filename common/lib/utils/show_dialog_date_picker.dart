import 'package:dependencies/intl.dart';
import 'package:flutter/material.dart';

Future<String?> showDialogDatePicker(BuildContext context) async {
  final choosenDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now().add(const Duration(days: -365 * 10)),
    lastDate: DateTime.now().add(const Duration(days: 365 * 50))
  );

  if (choosenDate != null){
    return DateFormat('dd MMMM yyyy', "id_ID").format(choosenDate);
  }
  else {
    return null;
  }
}