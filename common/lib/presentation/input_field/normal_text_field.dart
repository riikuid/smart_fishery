import 'package:common/presentation/input_field/styles/styles.dart';
import 'package:common/themes.dart';
import 'package:flutter/material.dart';

class NormalTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? errorMessage;
  final TextInputType keyboardType;
  const NormalTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.errorMessage,
    this.keyboardType = TextInputType.number,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(
                text: label,
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
        TextField(
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
          ),
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            errorText: errorMessage,
            errorBorder: errorInputFieldBorder,
            focusedErrorBorder: errorInputFieldBorder,
            enabledBorder: enabledInputFieldBorder,
            focusedBorder: focusedInputFieldBorder,
          ),
        ),
      ],
    );
  }
}
