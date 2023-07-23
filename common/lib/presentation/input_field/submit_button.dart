import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget{
  final void Function() onPressed;
  const SubmitButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: const ButtonStyle(
            padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 24)
            )
        ),
        child: const Text("Submit"),
      ),
    );
  }
}