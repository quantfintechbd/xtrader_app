import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_appbar.dart';
import 'package:xtrader_app/module/bottom_navigation/history/views/components/history_item_view.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../../../../global/widget/global_svg_loader.dart';
import '../../../../global/widget/global_text.dart';
import '../../../../utils/enum.dart';
import '../../../../utils/styles/k_assets.dart';
import '../../../../utils/styles/k_colors.dart';
import '../../trades/views/components/summery_item_view.dart';
import '../../trades/views/components/trades_item_view.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: context.height * 0.25,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: const [
                SummeryItemView(
                  title: "Balance:",
                  value: "69 943.20",
                ),
                SummeryItemView(
                  title: "Equity:",
                  value: "69 943.20",
                ),
                SummeryItemView(
                  title: "Margin:",
                  value: "9 943.20",
                ),
                SummeryItemView(
                  title: "Free Margin:",
                  value: "14 362.04",
                ),
                SummeryItemView(
                  title: "Margin Level (%):",
                  value: "1 362.04",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            color: context.theme.colorScheme.tertiaryContainer,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
              child: GlobalText(
                  str: "Positions",
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: KColor.textHintColor.color),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 20,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return HistoryItemView();
            }),
          ),
        ],
      ),
    );
  }
}
