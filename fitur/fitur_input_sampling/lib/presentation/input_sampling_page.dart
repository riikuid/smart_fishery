import 'package:common/presentation/input_field/normal_text_field.dart';
import 'package:common/presentation/input_field/styles/styles.dart';
import 'package:common/presentation/input_field/submit_button.dart';
import 'package:common/response/api_response.dart';
import 'package:common/themes.dart';
import 'package:dependencies/dropdown_button_2.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_input_sampling/data/repository/input_sampling_repository_impl.dart';
import 'package:fitur_input_sampling/presentation/input_sampling_provider.dart';
import 'package:flutter/material.dart';

class InputSamplingPage extends StatelessWidget {
  const InputSamplingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final idKolam = ModalRoute.of(context)?.settings.arguments as String;

    return ChangeNotifierProvider(
      create: (context) => InputSamplingProvider(
        repository: InputSamplingRepositoryImpl(),
        idKolam: idKolam,
      ),
      child:
          Consumer<InputSamplingProvider>(builder: (context, provider, child) {
        if (provider.submitResponse is ApiResponseSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // This will pop the current page after the build is complete.
            Navigator.pop(context, true);
          });
        }
        return Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Input Sampling",
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
            onPressed: provider.submitResponse is ApiResponseLoading
                ? null
                : provider.submitData,
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: verticalFormSpacingHeight,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(
                    height: verticalFormSpacingHeight,
                  ),
                  NormalTextField(
                    controller: provider.mbwController,
                    errorMessage: provider.mbwError,
                    label: "MBW (g)",
                  ),
                  const SizedBox(
                    height: verticalFormSpacingHeight,
                  ),
                  NormalTextField(
                    controller: provider.frController,
                    errorMessage: provider.frError,
                    label: "FR (%)",
                  ),
                  const SizedBox(
                    height: verticalFormSpacingHeight,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Kondisi Udang",
                              style: inputFieldLabelHeaderStyle,
                              children: [
                            TextSpan(
                                text: " *",
                                style: primaryTextStyle.copyWith(
                                  color: alertColor,
                                  fontSize: 12,
                                  fontWeight: semibold,
                                ))
                          ])),
                      const SizedBox(
                        height: labelAndFormSpacing,
                      ),
                      DropdownButtonFormField2<String>(
                        value: provider.kondisiUdang,
                        isExpanded: true,
                        decoration: InputDecoration(
                          // Add Horizontal padding using menuItemStyleData.padding so it matches
                          // the menu padding when button's width is not specified.
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.blueGrey.withOpacity(0.5),
                            ),
                            // borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: greenColor,
                            ),
                          ),
                          errorBorder: errorInputFieldBorder,
                          focusedErrorBorder: errorInputFieldBorder,
                          errorText: provider.kondisiUdangError,
                          // Add more decoration..
                        ),
                        hint: Text(
                          'Pilih Kondisi Udang',
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                        items: provider.allKondisiUdang
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Pilih Kondisi Udang!';
                          }
                          return null;
                        },
                        onChanged: provider.setKondisiUdang,
                        onSaved: provider.setKondisiUdang,
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(right: 10),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 24,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
