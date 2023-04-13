import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_text.dart';

import '../../../../../utils/styles/styles.dart';

class GradiantBox extends StatelessWidget {
  const GradiantBox({
    super.key,
    required this.text,
    this.radius,
  });
  final String text;
  final BorderRadius? radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffC0C0C0),
            Color(0xffFFFFFF),
            Color(0xffC0C0C0),
          ],
        ),
        border: Border.all(
          width: 1,
          color: Color(0xffA7A7A7),
        ),
        borderRadius: radius,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: GlobalText(
          str: text,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color: KColor.mineShaftCommmon.color,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
