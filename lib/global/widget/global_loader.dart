import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/utils/styles/k_colors.dart';

class GlobalLoader extends StatelessWidget {
  const GlobalLoader({Key? key, this.text = "Loading..."}) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator.adaptive(),
        SizedBox(width: 10.w),
        GlobalText(
          str: text ?? "Loading",
          color: KColor.mineShaftCommmon.color,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}
