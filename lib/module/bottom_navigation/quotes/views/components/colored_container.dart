import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/utils/extension.dart';

import 'multisized_text.dart';

class ColordContainer extends StatelessWidget {
  const ColordContainer({
    super.key,
    required this.color,
    required this.string,
  });
  final Color color;
  final String string;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(4.r)),
      child: Padding(
        padding: EdgeInsets.only(top: 6.h, bottom: 15.h),
        child: SizedBox(
          width: context.width,
          height: 25.h,
          child: MultisizedText(
            text: string,
          ),
        ),
      ),
    );
  }
}
