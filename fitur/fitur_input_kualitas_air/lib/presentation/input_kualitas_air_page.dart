import 'package:common/presentation/input_field/clock_picker_field.dart';
import 'package:common/presentation/input_field/date_field.dart';
import 'package:common/presentation/input_field/normal_text_field.dart';
import 'package:common/presentation/input_field/styles/styles.dart';
import 'package:common/presentation/input_field/submit_button.dart';
import 'package:common/response/api_response.dart';
import 'package:common/themes.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_input_kualitas_air/data/repository/input_kualitas_air_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:fitur_input_kualitas_air/presentation/input_kualitas_air_provider.dart';
class InputKualitasAirPage extends StatelessWidget{
  const InputKualitasAirPage({super.key});

  @override
  Widget build(BuildContext context) {
    final idKolam = ModalRoute.of(context)?.settings.arguments as String;

    return ChangeNotifierProvider(
      create: (context) => InputKualitasAirProvider(
        repository: InputKualitasAirRepositoryImpl(),
        idKolam: idKolam,
      ),
      child: Consumer<InputKualitasAirProvider>(
        builder: (context , provider , child) {
          if (provider.submitResponse is ApiResponseSuccess){
            WidgetsBinding.instance.addPostFrameCallback((_) {
              // This will pop the current page after the build is complete.
              Navigator.pop(context, true);
            });
          }
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Input Kualitas Air",
                style: primaryTextStyle.copyWith(fontWeight: bold),
              ),
              backgroundColor: whiteColor,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Color(0xFF1B9C85),
                ),
              ),
            ),
            bottomNavigationBar: SubmitButton(
              onPressed: provider.submitResponse is ApiResponseLoading ?
                null :
                provider.submitData,
            ),
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    DateField(
                        onValueChange: provider.setChoosenDate,
                        errorMessage: provider.choosenDateError,
                        choosenDate: provider.choosenDate
                    ),

                    const SizedBox(height: verticalFormSpacingHeight,),

                    ClockPickerField(
                      currentValue: provider.choosenTime,
                      onValueChange: provider.setChoosenTime,
                      errorMessage: provider.choosenTimeError,
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

                    NormalTextField(
                      controller: provider.kecerahanController,
                      label: "Kecerahan",
                      errorMessage: provider.kecerahanError,
                    ),

                    const SizedBox(height: 32,),
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