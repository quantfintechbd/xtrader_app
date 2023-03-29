import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/app_drawer.dart';
import 'package:xtrader_app/global/widget/global_appbar.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/views/components/quotes_item_view.dart';
import 'package:xtrader_app/utils/app_routes.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/navigation.dart';
import 'package:xtrader_app/utils/styles/k_assets.dart';

import '../../../../utils/styles/k_colors.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 25.h,
          ),
          Row(
            children: [
              Expanded(
                child: GlobalText(
                  str: "SYMBOL",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: KColor.stroke.color,
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: GlobalText(
                  str: "ASK",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: KColor.stroke.color,
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: GlobalText(
                  str: "BID",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: KColor.stroke.color,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return QuotesItemView();
                }),
          ),
        ],
      ),
    );
  }
}
