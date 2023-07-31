import 'package:common/presentation/input_field/styles/styles.dart';
import 'package:common/themes.dart';
import 'package:dependencies/intl.dart';
import 'package:flutter/material.dart';

class DateForm extends StatelessWidget {
  final String labelForm;
  final bool isRequired;
  final TextEditingController formController;
  final TextInputType formKeyboard;
  final String? errorText;

  DateForm(
    this.labelForm,
    this.formController,
    this.formKeyboard,
    this.isRequired,
    this.errorText,
  );

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
          readOnly: true,
          controller: formController,
          keyboardType: formKeyboard,
          style: primaryTextStyle.copyWith(
            fontSize: 12,
          ),
          onTap: () async {
            await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
            ).then((selectedDate) {
              if (selectedDate != null) {
                formController.text =
                    DateFormat('dd MMMM yyyy', "id_ID").format(selectedDate);
              }
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter date.';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: "Pilih Tanggal",
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
            errorText: errorText,
          ),
        ),
      ],
    );
  }
}
