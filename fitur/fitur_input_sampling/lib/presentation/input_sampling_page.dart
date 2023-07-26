import 'package:common/presentation/input_field/date_field.dart';
import 'package:common/presentation/input_field/input_field_app_bar.dart';
import 'package:common/presentation/input_field/normal_text_field.dart';
import 'package:common/presentation/input_field/styles/styles.dart';
import 'package:common/presentation/input_field/submit_button.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_input_sampling/presentation/input_sampling_provider.dart';
import 'package:flutter/material.dart';

class InputSamplingPage extends StatelessWidget {
  const InputSamplingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InputSamplingProvider(),
      child: Consumer<InputSamplingProvider>(
        builder: (context , provider , child) {
          return Scaffold(
            appBar: InputFieldAppBar(title: "Input Sampling"),
            bottomNavigationBar: SubmitButton(onPressed: provider.submit),
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    DateField(
                      onValueChange: provider.changeTanggal,
                      errorMessage: provider.tanggalError,
                      choosenDate: provider.tanggal,
                    ),

                    const SizedBox(height: verticalFormSpacingHeight,),

                    NormalTextField(
                      controller: provider.mbwController,
                      errorMessage: provider.mbwError,
                      label: "MBW",
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
