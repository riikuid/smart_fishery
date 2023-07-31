import 'package:common/presentation/input_field/punya_fahmi/date_form.dart';
import 'package:common/presentation/input_field/punya_fahmi/normal_form.dart';
import 'package:common/themes.dart';
import 'package:dependencies/dropdown_button_2.dart';
import 'package:flutter/material.dart';

class BuatKolamPage extends StatefulWidget {
  const BuatKolamPage({super.key});

  @override
  State<BuatKolamPage> createState() => _BuatKolamPageState();
}

class _BuatKolamPageState extends State<BuatKolamPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController namaKolamController = TextEditingController(text: '');
    TextEditingController panjangKolamController =
        TextEditingController(text: '');
    TextEditingController lebarKolamController =
        TextEditingController(text: '');
    TextEditingController kedalamanKolamController =
        TextEditingController(text: '');
    TextEditingController totalTebarController =
        TextEditingController(text: '');
    TextEditingController tanggalTebarController =
        TextEditingController(text: '');
    TextEditingController umurAwalController = TextEditingController(text: '');
    TextEditingController lamaPersiapanController =
        TextEditingController(text: '');

    String? tipeTotalTebarValue;

    final List<String> tipeTotalTebar = [
      "Netto",
      "Bruto",
      "Aktual",
    ];

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
                  hintText: "Tambak Sidoarjo",
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
                namaKolamController,
                TextInputType.name,
                true,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: NormalForm(
                      "Panjang Kolam (m)",
                      panjangKolamController,
                      TextInputType.number,
                      true,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: NormalForm(
                      "Lebar Kolam (m)",
                      lebarKolamController,
                      TextInputType.number,
                      true,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              NormalForm(
                "Kedalaman Kolam (m)",
                kedalamanKolamController,
                TextInputType.number,
                true,
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
                      totalTebarController,
                      TextInputType.number,
                      true,
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
                            // Add more decoration..
                          ),
                          hint: const Text(
                            'Pilih Tipe',
                            style: TextStyle(fontSize: 14),
                          ),
                          items: tipeTotalTebar
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
                          onChanged: (value) {
                            tipeTotalTebarValue = value.toString();
                            print(tipeTotalTebarValue);
                          },
                          onSaved: (value) {
                            tipeTotalTebarValue = value.toString();
                          },
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
                tanggalTebarController,
                TextInputType.number,
                true,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: NormalForm(
                      "Umur Awal (hari)",
                      umurAwalController,
                      TextInputType.number,
                      false,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: NormalForm(
                      "Lama Persiapan (hari)",
                      lamaPersiapanController,
                      TextInputType.number,
                      false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
    );
  }
}
