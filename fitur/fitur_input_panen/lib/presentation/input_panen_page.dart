import 'package:common/presentation/input_field/date_field.dart';
import 'package:common/presentation/input_field/input_field_app_bar.dart';
import 'package:common/presentation/input_field/normal_text_field.dart';
import 'package:common/presentation/input_field/styles/styles.dart';
import 'package:common/presentation/input_field/submit_button.dart';
import 'package:dependencies/provider.dart';
import 'package:fitur_input_panen/presentation/input_panen_provider.dart';
import 'package:flutter/material.dart';

class InputPanenPage extends StatefulWidget{
  const InputPanenPage({super.key});


  @override
  State<InputPanenPage> createState() => _InputPanenPageState();
}

class _InputPanenPageState extends State<InputPanenPage> {
  late InputPanenProvider provider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InputPanenProvider(),
      child: Builder(
        builder: (context) {
          provider = Provider.of(context , listen: true);

          return Scaffold(
            appBar: InputFieldAppBar(title: "Input Panen"),
            bottomNavigationBar: SubmitButton(
              onPressed: provider.submitData,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      DateField(
                        onValueChange: provider.setTanggal,
                        errorMessage: provider.tanggalError,
                        choosenDate: provider.tanggal
                      ),

                      const SizedBox(height: verticalFormSpacingHeight,),

                      Row(
                         children: [
                           Expanded(
                             child: NormalTextField(
                               controller: provider.beratController,
                               label: "Berat",
                               errorMessage: provider.beratError
                             ),
                           ),

                           const SizedBox(width: horizontalFormSpacingWidth,),

                           Expanded(
                             child: NormalTextField(
                                 controller: provider.sizeController,
                                 label: "Size",
                                 errorMessage: provider.sizeError
                             ),
                           ),
                         ],
                      ),

                      const SizedBox(height: verticalFormSpacingHeight,),

                      Row(
                         children: [
                           Expanded(
                             child: NormalTextField(
                               controller: provider.jenisController,
                               label: "Jenis",
                               errorMessage: provider.jenisError,
                               keyboardType: TextInputType.text,
                             ),
                           ),

                           const SizedBox(width: horizontalFormSpacingWidth,),

                           const Expanded(
                             child: SizedBox()
                           ),
                         ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  @override
  void dispose() {
    provider.disposeResource();
    super.dispose();
  }
}