import 'package:common/presentation/input_field/normal_text_field.dart';
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
        debugPrint("kita ganteng0");
        debugPrint("${provider.submitResponse.runtimeType}");
        if (provider.submitResponse is ApiResponseSuccess) {
          debugPrint("kita ganteng1");
          WidgetsBinding.instance.addPostFrameCallback((_) {
            debugPrint("kita ganteng2");
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
              "Buat Tambak",
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
                    height: 10,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Nama Tambak",
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
                        controller: provider.textEditingController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          errorText: provider.textFieldError,
                          errorBorder: errorInputFieldBorder,
                          focusedErrorBorder: errorInputFieldBorder,
                          enabledBorder: enabledInputFieldBorder,
                          focusedBorder: focusedInputFieldBorder,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
