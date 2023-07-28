import 'package:common/themes.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  final String labelForm;
  final TextEditingController formController;
  final TextInputType formKeyboard;

  AuthForm(
    this.labelForm,
    this.formController,
    this.formKeyboard,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelForm,
          style: secondaryTextStyle.copyWith(
            fontSize: 12,
            fontWeight: semibold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 10.0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: TextFormField(
            controller: formController,
            keyboardType: formKeyboard,
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
            ),
            decoration: InputDecoration.collapsed(
              filled: true,
              fillColor: Colors.transparent,
              hintText: "Enter your full name",
              hintStyle: primaryTextStyle.copyWith(
                color: Colors.grey[500],
                fontWeight: regular,
              ),
              hoverColor: Colors.transparent,
            ),
            onFieldSubmitted: (value) {},
          ),
        )
      ],
    );
  }
}
