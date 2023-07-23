import 'package:common/presentation/input_field/date_field.dart';
import 'package:common/presentation/input_field/normal_text_field.dart';
import 'package:common/presentation/input_field/styles/styles.dart';
import 'package:common/presentation/input_field/submit_button.dart';
import 'package:dependencies/provider.dart';
import 'package:flutter/material.dart';
import 'package:fitur_input_kualitas_air/presentation/input_kualitas_air_provider.dart';
class InputKualitasAirPage extends StatefulWidget{
  const InputKualitasAirPage({super.key});

  @override
  State<InputKualitasAirPage> createState() => _InputKualitasAirPageState();
}

class _InputKualitasAirPageState extends State<InputKualitasAirPage> {
  InputKualitasAirProvider? provider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InputKualitasAirProvider(),
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text("Input Kualitas Air"),
          centerTitle: true,
        ),
        body: Consumer<InputKualitasAirProvider>(
          builder: (context , provider , child) {
            this.provider = provider;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DateField(
                        onValueChange: provider.setChoosenDate,
                        errorMessage: provider.choosenDateError,
                        choosenDate: provider.choosenDate
                      ),

                      const SizedBox(height: verticalFormSpacingHeight,),

                      Row(
                        children: [
                          Expanded(
                            child: NormalTextField(
                                controller: provider.suhuController,
                                label: "Suhu",
                                errorMessage: provider.suhuError,
                            ),
                          ),

                          const SizedBox(width: 24,),

                          Expanded(
                            child: NormalTextField(
                                controller: provider.doController,
                                label: "DO",
                                errorMessage: provider.doError
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: verticalFormSpacingHeight,),

                      Row(
                        children: [
                          Expanded(
                            child: NormalTextField(
                              controller: provider.salController,
                              label: "Sal",
                              errorMessage: provider.salError,
                            ),
                          ),

                          const SizedBox(width: horizontalFormSpacingWidth,),

                          Expanded(
                            child: NormalTextField(
                                controller: provider.phController,
                                label: "PH",
                                errorMessage: provider.phError
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: verticalFormSpacingHeight,),

                      Row(
                        children: [
                          Expanded(
                            child: NormalTextField(
                              controller: provider.orpController,
                              label: "ORP",
                              errorMessage: provider.orpError,
                            ),
                          ),

                          const SizedBox(width: horizontalFormSpacingWidth,),

                          const Expanded(
                            child: SizedBox()
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 32,),
                      
                      SubmitButton(onPressed: provider.submitData),

                      const SizedBox(height: 32,),
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  @override
  void dispose() {
    provider?.disposeResource();
    super.dispose();
  }
}