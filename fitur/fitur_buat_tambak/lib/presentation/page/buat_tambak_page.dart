import 'package:common/presentation/input_field/styles/styles.dart';
import 'package:common/presentation/input_field/submit_button.dart';
import 'package:common/response/api_response.dart';
import 'package:common/themes.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_buat_tambak/data/repository/buat_tambak_repository_impl.dart';
import 'package:fitur_buat_tambak/presentation/provider/buat_tambak_provider.dart';
import 'package:flutter/material.dart';

class BuatTambakPage extends StatefulWidget {
  const BuatTambakPage({super.key});

  @override
  State<BuatTambakPage> createState() => _BuatTambakPageState();
}

class _BuatTambakPageState extends State<BuatTambakPage> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BuatTambakProvider(
        repository: BuatTambakRepositoryImpl(),
      ),
      child: Consumer<BuatTambakProvider>(builder: (context, provider, child) {
        return FutureBuilder(
            future: provider.submitResponse,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data! is ApiResponseSuccess) {
                  Navigator.pop(context, true);
                }
              }

              return Scaffold(
                  // backgroundColor: Color(0xFFECE1E1),
                  backgroundColor: whiteColor,
                  appBar: AppBar(
                    elevation: 0,
                    centerTitle: true,
                    title: Text(
                      "Buat Tambak Baru",
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Nama Tambak",
                              style: primaryTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: semibold,
                              ),
                            ),
                            Text(
                              " *",
                              style: primaryTextStyle.copyWith(
                                color: alertColor,
                                fontSize: 14,
                                fontWeight: semibold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: textEditingController,
                          maxLength: 25,
                          style: primaryTextStyle.copyWith(),
                          decoration: InputDecoration(
                            errorText: provider.textFieldError,
                            enabledBorder: enabledInputFieldBorder,
                            focusedBorder: focusedInputFieldBorder,
                            errorBorder: errorInputFieldBorder,
                            focusedErrorBorder: errorInputFieldBorder,
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottomNavigationBar: SubmitButton(
                    onPressed: snapshot.hasData
                        ? () {
                            provider.submitData(textEditingController.text);
                          }
                        : null,
                  ));
            });
      }),
    );
  }
}
