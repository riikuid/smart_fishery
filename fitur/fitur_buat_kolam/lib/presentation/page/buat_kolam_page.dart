import 'package:common/presentation/input_field/punya_fahmi/date_form.dart';
import 'package:common/presentation/input_field/punya_fahmi/normal_form.dart';
import 'package:common/presentation/input_field/styles/styles.dart';
import 'package:common/presentation/loading_button.dart';
import 'package:common/response/api_response.dart';
import 'package:common/routes/argument/input_kolam_argument.dart';
import 'package:common/themes.dart';
import 'package:dependencies/dropdown_button_2.dart';
import 'package:fitur_buat_kolam/data/repository/buat_kolam_repository_impl.dart';
import 'package:fitur_buat_kolam/presentation/provider/buat_kolam_provider.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/provider.dart';

class BuatKolamPage extends StatelessWidget {
  const BuatKolamPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final argument =
        ModalRoute.of(context)?.settings.arguments as InputKolamArgument;

    return ChangeNotifierProvider(
      create: (context) => BuatKolamProvider(
        repository: BuatKolamRepositoryImpl(),
        argument: argument,
      ),
      child: Consumer<BuatKolamProvider>(builder: (context, provider, child) {
        if (provider.submitResponse is ApiResponseSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.pop(context, true);
          });
        }
        return Scaffold(
          // backgroundColor: Color(0xFFECE1E1),
          backgroundColor: whiteColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Buat Kolam Baru",
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

          body: Container(
            padding: const EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Buat Kolam untuk tambak",
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: semibold,
                        ),
                      ),
                      Text(
                        " *",
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
                      hintText: provider.tambak.name,
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
                    height: 20,
                  ),
                  NormalForm(
                    "Nama Kolam",
                    provider.namaKolamController,
                    TextInputType.name,
                    true,
                    provider.namaKolamError,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: NormalForm(
                          "Panjang Kolam (m)",
                          provider.panjangKolamController,
                          TextInputType.number,
                          true,
                          provider.panjangKolamError,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: NormalForm(
                          "Lebar Kolam (m)",
                          provider.lebarKolamController,
                          TextInputType.number,
                          true,
                          provider.lebarKolamError,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  NormalForm(
                    "Kedalaman Kolam (m)",
                    provider.kedalamanKolamController,
                    TextInputType.number,
                    true,
                    provider.kedalamanKolamError,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Siklus Kolam",
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  const Divider(
                    // thickness: 1,
                    color: Colors.blueGrey,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: NormalForm(
                          "Total Tebar (ekor)",
                          provider.totalTebarController,
                          TextInputType.number,
                          true,
                          provider.totalTebarError,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Tipe Total Tebar",
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: semibold,
                                  ),
                                ),
                                Text(
                                  " *",
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
                            DropdownButtonFormField2<String>(
                              value: provider.tipeTotalTebar,
                              isExpanded: true,
                              decoration: InputDecoration(
                                // Add Horizontal padding using menuItemStyleData.padding so it matches
                                // the menu padding when button's width is not specified.
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 18),
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
                                errorText: provider.tipeTotalTebarError,
                                // Add more decoration..
                              ),
                              hint: Text(
                                'Pilih Tipe',
                                style: primaryTextStyle.copyWith(fontSize: 14),
                              ),
                              items: provider.allTipeTotalTebar
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
                                  return 'Pilih Tipe!';
                                }
                                return null;
                              },
                              onChanged: provider.setTipeTotalTebar,
                              onSaved: provider.setTipeTotalTebar,
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
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DateForm(
                    "Tanggal Tebar",
                    provider.tanggalTebarController,
                    TextInputType.number,
                    true,
                    provider.tanggalTebarError,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: NormalForm(
                          "Umur Awal",
                          provider.umurAwalController,
                          TextInputType.number,
                          true,
                          provider.umurAwalError,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: NormalForm(
                            "Lama Persiapan",
                            provider.lamaPersiapanController,
                            TextInputType.number,
                            true,
                            provider.lamaPersiapanError),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: InkWell(
            onTap: provider.submitResponse is ApiResponseLoading
                ? null
                : provider.submitData,
            child: provider.submitResponse is ApiResponseLoading
                ? const LoadingButton()
                : Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      "Buat Kolam",
                      textAlign: TextAlign.center,
                      style: primaryTextStyle.copyWith(
                        color: whiteColor,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
          ),
        );
      }),
    );
  }
}
