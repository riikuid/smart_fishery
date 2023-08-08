import 'package:common/presentation/input_field/styles/styles.dart';
import 'package:common/themes.dart';
import 'package:flutter/material.dart';

class ClockPickerField extends StatelessWidget {
  final String currentValue;
  final void Function(String) onValueChange;
  final String? errorMessage;
  const ClockPickerField({
    super.key,
    required this.currentValue,
    required this.onValueChange,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(
                text: "Waktu Pengecekan",
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
              final timePicked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
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
              if (timePicked != null && context.mounted) {
                onValueChange(timePicked.format(context));
              }
            },
            child: InputDecorator(
              isEmpty: currentValue.isEmpty,
              decoration: InputDecoration(
                enabledBorder: enabledInputFieldBorder,
                focusedBorder: focusedInputFieldBorder,
                focusedErrorBorder: errorInputFieldBorder,
                errorBorder: errorInputFieldBorder,
                contentPadding: inputFieldContentPadding,
                errorText: errorMessage,
                suffixIcon: const Icon(Icons.access_time),
              ),
              child: Text(currentValue),
            ),
          ),
        ),
      ],
    );
  }
}
