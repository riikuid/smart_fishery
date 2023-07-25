import 'package:common/themes.dart';
import 'package:flutter/material.dart';

final inputFieldLabelHeaderStyle = primaryTextStyle.copyWith(
  fontWeight: semibold,
  fontSize: 12,
);

final inputFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide.none
);

final enabledInputFieldBorder =  OutlineInputBorder(
  borderSide: BorderSide(
    width: 1,
    color: Colors.blueGrey.withOpacity(0.5),
  ),
);

final focusedInputFieldBorder = OutlineInputBorder(
  borderSide: BorderSide(
    width: 2,
    color: greenColor,
  ),
);

const inputFieldColor = Colors.black12;

const inputFieldContentPadding = EdgeInsets.symmetric(
  vertical: 16,
  horizontal: 12,
);

const labelAndFormSpacing = 4.0;
const verticalFormSpacingHeight = 24.0;
const horizontalFormSpacingWidth = 20.0;