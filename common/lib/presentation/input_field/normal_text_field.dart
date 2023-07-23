import 'package:common/presentation/input_field/styles/styles.dart';
import 'package:flutter/material.dart';

class NormalTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? errorMessage;
  final TextInputType keyboardType;
  const NormalTextField({super.key,
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
        Text(
          label,
          style: inputFieldLabelHeaderStyle,
        ),

        const SizedBox(height: labelAndFormSpacing,),

        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            errorText: errorMessage,
            border: inputFieldBorder,
            filled: true,
            fillColor: inputFieldColor,
          ),
        ),
      ],
    );
  }
}