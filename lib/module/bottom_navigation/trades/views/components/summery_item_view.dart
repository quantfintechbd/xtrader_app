import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../../../../../utils/styles/styles.dart';

class SummeryItemView extends StatelessWidget {
  const SummeryItemView({
    required this.title,
    required this.value,
    super.key,
  });
  final String title, value;
  @override
  Widget build(
    context,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
      child: Row(
        children: [
          GlobalText(
            str: title,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: context.theme.textTheme.displayLarge?.color,
          ),
          Expanded(
            child: DottedLine(
              dashColor: KColor.stroke.color,
              dashRadius: 0.1,
            ),
          ),
          GlobalText(
            str: value,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: context.theme.textTheme.displayLarge?.color,
          ),
        ],
      ),
    );
  }
}
