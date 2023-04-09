import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        padding: EdgeInsets.only(top: 6, bottom: 15, right: 20.w, left: 20.w),
        child: SizedBox(
          width: 150.w,
          height: 25.h,
          child: MultisizedText(
            text: string,
          ),
        ),
      ),
    );
  }
}
