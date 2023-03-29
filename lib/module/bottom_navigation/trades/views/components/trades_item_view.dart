import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/views/components/trades_bottom_sheet.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/styles/styles.dart';
import 'package:xtrader_app/utils/view_util.dart';

class TradesItemView extends StatefulWidget {
  const TradesItemView({super.key});

  @override
  State<TradesItemView> createState() => _TradesItemViewState();
}

class _TradesItemViewState extends State<TradesItemView> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                visible = !visible;
              });
            },
            onLongPress: () {
              ViewUtil.bottomSheet(
                  context: context, content: TradesBottomSheet());
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GlobalText(
                              str: "BRENT,",
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                            ),
                            GlobalText(
                              str: " Sell 0.05",
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              color: KColor.red.color,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GlobalText(
                              str: "74.38",
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                              color: KColor.sixA6a6a.color,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            GlobalSvgLoader(
                              imagePath: KAssetName.rightArrow.imagePath,
                              svgFor: SvgFor.asset,
                              color: KColor.sixA6a6a.color,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            GlobalText(
                              str: "74.04",
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                              color: KColor.sixA6a6a.color,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    GlobalText(
                      str: "14 362.04",
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                      color: KColor.primary.color,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Divider(
                  height: 1,
                  color: KColor.primary.color,
                ),
              ],
            ),
          ),
          Visibility(
            visible: visible,
            maintainAnimation: true,
            maintainState: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                GlobalText(
                  str: "2023-03-16  18:20:46",
                  fontWeight: FontWeight.w400,
                  fontSize: 13.sp,
                  color: KColor.sixA6a6a.color,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          DTItem(
                            title: "S/L",
                            value: "0",
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          DTItem(
                            title: "T/P",
                            value: "0",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          DTItem(title: "Swap", value: "0"),
                          SizedBox(
                            height: 6.h,
                          ),
                          DTItem(
                            title: "ID",
                            value: "46321789",
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Divider(
                  height: 1,
                  color: KColor.primary.color,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DTItem extends StatelessWidget {
  const DTItem({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GlobalText(
          str: title,
          fontWeight: FontWeight.w400,
          fontSize: 13.sp,
          color: KColor.sixA6a6a.color,
        ),
        Expanded(
          child: GlobalText(
            str: value,
            fontWeight: FontWeight.w400,
            fontSize: 13.sp,
            color: KColor.sixA6a6a.color,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
