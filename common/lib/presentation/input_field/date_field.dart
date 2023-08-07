import 'package:common/presentation/input_field/styles/styles.dart';
import 'package:common/themes.dart';
import 'package:common/utils/show_dialog_date_picker.dart';
import 'package:flutter/material.dart';

class DateField extends StatelessWidget {
  final void Function(String) onValueChange;
  final String? errorMessage;
  final String choosenDate;
  const DateField({
    super.key,
    required this.onValueChange,
    required this.errorMessage,
    required this.choosenDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(
                text: "Tanggal",
                style: inputFieldLabelHeaderStyle,
                children: [
              TextSpan(
                  text: " *",
                  style: primaryTextStyle.copyWith(
                    color: alertColor,
                    fontSize: 12,
                    fontWeight: semibold,
                  ))
            ])),
        const SizedBox(
          height: labelAndFormSpacing,
        ),
        SizedBox(
          width: double.infinity,
          child: GestureDetector(
            onTap: () async {
              final datePicked = await showDialogDatePicker(context);
              if (datePicked != null) {
                onValueChange(datePicked);
              }
            },
            child: InputDecorator(
              isEmpty: choosenDate.isEmpty,
              decoration: InputDecoration(
                enabledBorder: enabledInputFieldBorder,
                focusedBorder: focusedInputFieldBorder,
                focusedErrorBorder: errorInputFieldBorder,
                errorBorder: errorInputFieldBorder,
                contentPadding: inputFieldContentPadding,
                errorText: errorMessage,
                suffixIcon: const Icon(Icons.date_range),
              ),
              child: Text(
                choosenDate,
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
