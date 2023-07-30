import 'package:common/themes.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget{
  final void Function()? onPressed;
  const SubmitButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: FilledButton(
          onPressed: onPressed,
          style: ButtonStyle(
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 15),
              ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              ),
            ),
            backgroundColor: MaterialStatePropertyAll(greenColor),
          ),
          child: Text(
            "Submit",
            style: primaryTextStyle.copyWith(
              fontWeight: semibold,
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}