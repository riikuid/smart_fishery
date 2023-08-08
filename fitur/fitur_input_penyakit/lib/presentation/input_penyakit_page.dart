import 'package:common/presentation/input_field/normal_text_field.dart';
import 'package:common/presentation/input_field/styles/styles.dart';
import 'package:common/presentation/input_field/submit_button.dart';
import 'package:common/response/api_response.dart';
import 'package:common/themes.dart';
import 'package:dependencies/dropdown_button_2.dart';
import 'package:dependencies/intl.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_input_penyakit/data/repository/input_penyakit_repository_impl.dart';
import 'package:fitur_input_penyakit/presentation/input_penyakit_provider.dart';
import 'package:fitur_input_penyakit/presentation/pilih_penyakit_udang_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPenyakitPage extends StatelessWidget {
  const InputPenyakitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final idKolam = ModalRoute.of(context)?.settings.arguments as String;

    return ChangeNotifierProvider(
      create: (context) => InputPenyakitProvider(
        repository: InputPenyakitRepositoryImpl(),
        idKolam: idKolam,
      ),
      child:
          Consumer<InputPenyakitProvider>(builder: (context, provider, child) {
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
              "Input Penyakit",
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Tanggal",
                            style: primaryTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: semibold,
                            ),
                          ),
                          Text(
                            "",
                            style: primaryTextStyle.copyWith(
                              color: alertColor,
                              fontSize: 12,
                              fontWeight: semibold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        readOnly: true,
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                        ),
                        decoration: InputDecoration(
                          hintText: DateFormat('dd MMMM yyyy', "id_ID")
                              .format(DateTime.now()),
                          hintStyle: secondaryTextStyle.copyWith(
                            fontSize: 14,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.blueGrey.withOpacity(0.5),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.blueGrey.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: verticalFormSpacingHeight,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Nama Penyakit",
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
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/pilih-penyakit",
                              arguments: provider);
                        },
                        child: InputDecorator(
                          isEmpty: provider.choosenPenyakitUdang == null,
                          child: Visibility(
                            visible: provider.choosenPenyakitUdang != null,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  provider.choosenPenyakitUdang?.namaPendek ??
                                      "",
                                  style: primaryTextStyle.copyWith(),
                                ),
                                Text(
                                  provider.choosenPenyakitUdang?.namaPanjang ??
                                      "",
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: semibold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          decoration: InputDecoration(
                            hintText: "Pilih Nama Penyakit",
                            alignLabelWithHint: false,
                            hintStyle: secondaryTextStyle.copyWith(
                              fontSize: 14,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.blueGrey.withOpacity(0.5),
                              ),
                            ),
                            errorBorder: errorInputFieldBorder,
                            errorText: provider.namaPenyakitError,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.blueGrey.withOpacity(0.5),
                              ),
                            ),
                          ),
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
