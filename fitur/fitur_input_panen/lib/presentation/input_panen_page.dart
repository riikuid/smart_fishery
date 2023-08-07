import 'package:common/presentation/input_field/normal_text_field.dart';
import 'package:common/presentation/input_field/styles/styles.dart';
import 'package:common/presentation/input_field/submit_button.dart';
import 'package:common/response/api_response.dart';
import 'package:common/themes.dart';
import 'package:dependencies/intl.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_input_panen/data/repository/input_panen_repository_impl.dart';
import 'package:fitur_input_panen/presentation/input_panen_provider.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dropdown_button_2.dart';

class InputPanenPage extends StatefulWidget {
  const InputPanenPage({super.key});

  @override
  State<InputPanenPage> createState() => _InputPanenPageState();
}

class _InputPanenPageState extends State<InputPanenPage> {
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern("en").format(int.parse(s));
  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: "en").currencySymbol;
  @override
  Widget build(BuildContext context) {
    final idKolam = ModalRoute.of(context)?.settings.arguments as String;

    return ChangeNotifierProvider(
      create: (context) => InputPanenProvider(
        repository: InputPanenRepositoryImpl(),
        idKolam: idKolam,
      ),
      child: Consumer<InputPanenProvider>(builder: (context, provider, child) {
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
              "Input Hasil Panen",
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: NormalTextField(
                              controller: provider.beratController,
                              label: "Total Berat",
                              errorMessage: provider.beratError),
                        ),
                        const SizedBox(
                          width: horizontalFormSpacingWidth,
                        ),
                        Expanded(
                          child: NormalTextField(
                              controller: provider.sizeController,
                              label: "Size",
                              errorMessage: provider.sizeError),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: verticalFormSpacingHeight,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: "Jenis Panen",
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
                          value: provider.jenisPanen,
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
                            errorText: provider.jenisPanenError,
                            // Add more decoration..
                          ),
                          hint: Text(
                            'Pilih Jenis',
                            style: primaryTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: medium,
                            ),
                          ),
                          items: provider.allJenisPanen
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
                              return 'Pilih Jenis!';
                            }
                            return null;
                          },
                          onChanged: provider.setJenisPanen,
                          onSaved: provider.setJenisPanen,
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
                    const SizedBox(
                      height: verticalFormSpacingHeight,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: "Harga Perkilo",
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
                        TextField(
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                          onChanged: (string) {
                            string =
                                '${_formatNumber(string.replaceAll(',', ''))}';
                            provider.hargaPerKiloController.value =
                                TextEditingValue(
                              text: string,
                              selection: TextSelection.collapsed(
                                offset: string.length,
                              ),
                            );
                          },
                          controller: provider.hargaPerKiloController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: Container(
                              // margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 50,
                              alignment: Alignment.center,
                              child: Text(
                                'Rp.',
                                style: primaryTextStyle.copyWith(
                                  fontWeight: medium,
                                ),
                              ),
                            ),
                            errorText: provider.hargaPerKiloError,
                            errorBorder: errorInputFieldBorder,
                            focusedErrorBorder: errorInputFieldBorder,
                            enabledBorder: enabledInputFieldBorder,
                            focusedBorder: focusedInputFieldBorder,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
