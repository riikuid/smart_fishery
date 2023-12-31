import 'package:common/presentation/input_field/styles/styles.dart';
import 'package:common/themes.dart';
import 'package:flutter/material.dart';

class NormalForm extends StatelessWidget {
  final String labelForm;
  final bool isRequired;
  final TextEditingController formController;
  final TextInputType formKeyboard;
  final String? errorMessage;

  const NormalForm(this.labelForm, this.formController, this.formKeyboard,
      this.isRequired, this.errorMessage,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              labelForm,
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: semibold,
              ),
            ),
            isRequired
                ? Text(
                    " *",
                    style: primaryTextStyle.copyWith(
                      color: alertColor,
                      fontSize: 12,
                      fontWeight: semibold,
                    ),
                  )
                : const SizedBox(
                    width: 2,
                  ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: formController,
          keyboardType: formKeyboard,
          style: primaryTextStyle.copyWith(
            fontSize: 14,
          ),
          decoration: InputDecoration(
            errorText: errorMessage,
            hintText: isRequired ? "" : "Opsional",
            hintStyle: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.blueGrey.withOpacity(0.5),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: greenColor,
              ),
            ),
            errorBorder: errorInputFieldBorder,
            focusedErrorBorder: errorInputFieldBorder,
          ),
        ),
      ],
    );
  }
}
