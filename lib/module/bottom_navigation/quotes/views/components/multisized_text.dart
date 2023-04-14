import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../../../../../utils/styles/styles.dart';

class MultisizedText extends StatelessWidget {
  const MultisizedText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text.length > 4 ? text.substring(0, text.length - 3) : '',
        style: KTextStyle.customTextStyle(
          color: KColor.white.color,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: text.length > 3
                ? text.substring(text.length - 3, text.length - 1)
                : '',
            style: KTextStyle.customTextStyle(
              color: KColor.white.color,
              fontSize: 26.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: text.substring(text.length - 1),
            style: KTextStyle.customTextStyle(
              color: KColor.white.color,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
