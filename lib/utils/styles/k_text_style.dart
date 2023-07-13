import 'package:flutter/material.dart';

import 'package:xtrader_app/constant/constant_key.dart';

class KTextStyle {
  static TextStyle customTextStyle(
          {double fontSize = 12,
          fontWeight = FontWeight.normal,
          required Color color}) =>
      TextStyle(
          fontFamily: AppConstant.FONTFAMILY.name,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color);
}
