import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/utils/styles/k_colors.dart';

import 'gradiant_box.dart';

class ScaleComponent extends StatelessWidget {
  const ScaleComponent({
    super.key,
    required this.midValue,
  });
  final String midValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: GradiantBox(
            text: "-0.1",
            radius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              bottomLeft: Radius.circular(8.r),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GradiantBox(
            text: "-0.01",
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              color: KColor.white.color,
              border: Border.symmetric(
                  horizontal:
                      BorderSide(color: KColor.stroke.color, width: 1.h)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: GlobalText(
                str: midValue,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: KColor.mineShaftCommmon.color,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GradiantBox(
            text: "+0.01",
          ),
        ),
        Expanded(
          flex: 1,
          child: GradiantBox(
            text: "+0.1",
            radius: BorderRadius.only(
              topRight: Radius.circular(8.r),
              bottomRight: Radius.circular(8.r),
            ),
          ),
        ),
      ],
    );
  }
}
