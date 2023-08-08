import 'package:common/themes.dart';
import 'package:dependencies/intl.dart';
import 'package:flutter/material.dart';

Future<String?> showDialogDatePicker(BuildContext context) async {
  final choosenDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now().add(const Duration(days: -365 * 10)),
    lastDate: DateTime.now().add(const Duration(days: 365 * 50)),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: greenColor, // <-- SEE HERE
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.red, // button text color
            ),
          ),
        ),
        child: child!,
      );
    },
  );

  if (choosenDate != null) {
    return DateFormat('dd MMMM yyyy', "id_ID").format(choosenDate);
  } else {
    return null;
  }
}
