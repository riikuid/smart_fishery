import 'package:common/themes.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

Future<bool> buildConfirmDialog(BuildContext context){
  return confirm(
    context,
    title: Text(
      'CONFIRM',
      style: primaryTextStyle.copyWith(
        fontWeight: semibold, fontSize: 16,
      ),
    ),
    content: Text(
      'Would you like to remove?',
      style: primaryTextStyle.copyWith(
        fontWeight: medium, fontSize: 16,
      ),
    ),
    textOK: Text(
      'Yes',
      style: primaryTextStyle.copyWith(
        fontWeight: semibold,
        fontSize: 16,
        color: const Color(0xFF0079FF),
      ),
    ),
    textCancel: Text(
      'No',
      style: primaryTextStyle.copyWith(
        fontWeight: semibold,
        fontSize: 16,
        color: const Color(0xFFC82C2C),
      ),
    ),
  );
}