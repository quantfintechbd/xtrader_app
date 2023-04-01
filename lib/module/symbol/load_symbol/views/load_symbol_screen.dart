import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/utils/styles/k_colors.dart';

class LoadSymbolScreen extends StatelessWidget {
  const LoadSymbolScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KColor.scafoldBg.color,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                GlobalText(
                  str: "Loading Symbols...",
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
                SizedBox(
                  height: 20.h,
                ),
                LinearProgressIndicator(
                  value: 0.2,
                  backgroundColor: KColor.white.color,
                  semanticsLabel: 'Linear progress indicator',
                ),
                Spacer(),
                GlobalText(
                  str: "Loading 10 of 214 symbols",
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  color: KColor.scondaryTextColor.color,
                ),
              ],
            ),
          ),
        ));
  }
}
