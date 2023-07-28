import 'package:common/themes.dart';
import 'package:flutter/material.dart';

class PasswordForm extends StatefulWidget {
  final String labelForm;
  final String hintTextForm;
  final TextEditingController formController;
  final TextInputType formKeyboard;

  PasswordForm(
    this.labelForm,
    this.hintTextForm,
    this.formController,
    this.formKeyboard,
  );

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  var _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelForm,
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
            vertical: 6.0,
            horizontal: 10.0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  obscureText: _isObscure, // gunakan kondisi _isObscure
                  controller: widget.formController,
                  keyboardType: widget.formKeyboard,
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                  decoration: InputDecoration.collapsed(
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: widget.hintTextForm,
                    hintStyle: primaryTextStyle.copyWith(
                      color: Colors.grey[500],
                      fontWeight: regular,
                    ),
                    hoverColor: Colors.transparent,
                  ),
                  onFieldSubmitted: (value) {},
                ),
              ),
              IconButton(
                splashColor: Colors.transparent,
                splashRadius: 1,
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: subtitleColor,
                  size: 18,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure =
                        !_isObscure; // toggle kondisi _isObscure ketika button ditekan
                  });
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
