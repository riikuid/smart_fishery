import 'package:common/themes.dart';
import 'package:flutter/material.dart';

class InputFieldAppBar extends AppBar{
  InputFieldAppBar({super.key , required String title}) :
      super(
        centerTitle: true,
        title: Text(
          title,
          style: primaryTextStyle.copyWith(
            fontWeight: bold
          ),
        ),
        leading: BackButton(
          color: greenColor,
        ),
        backgroundColor: Colors.white,
      );
}