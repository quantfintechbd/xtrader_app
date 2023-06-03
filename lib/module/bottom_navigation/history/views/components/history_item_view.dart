import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/module/bottom_navigation/history/model/history_response.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/styles/styles.dart';

class HistoryItemView extends StatefulWidget {
  const HistoryItemView({super.key, required this.details});
  final HistoryDetails details;
  @override
  State<HistoryItemView> createState() => _HistoryItemViewState();
}

class _HistoryItemViewState extends State<HistoryItemView> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                visible = !visible;
              });
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
                              str: "${widget.details.symbol ?? ''},",
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                            ),
                            GlobalText(
                              str:
                                  " ${widget.details.action?.capitalize() ?? ''} ${widget.details.volume}",
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              color:
                                  widget.details.action?.toLowerCase() == 'buy'
                                      ? KColor.primary.color
                                      : KColor.red.color,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        GlobalText(
                          str: widget.details.closeTime ?? '',
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                          color: KColor.sixA6a6a.color,
                        ),
                        /*  Row(
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
                        ),*/
                      ],
                    ),
                    Spacer(),
                    GlobalText(
                      str: widget.details.profit.toString().asCurrency,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                      color: widget.details.profit != null &&
                              widget.details.profit!.parseToDouble() > 0.0 ==
                                  true
                          ? KColor.primary.color
                          : KColor.red.color,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                DottedLine(
                  dashColor: KColor.primary.color,
                  dashRadius: 0.1,
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
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          DTItem(
                            title: "S/L",
                            value: widget.details.priceSL ?? '',
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          DTItem(
                            title: "T/P",
                            value: widget.details.priceTP ?? '',
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          DTItem(
                            title: "Time",
                            value: widget.details.time ?? '',
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
                          DTItem(
                            title: "Swap",
                            value: widget.details.swap ?? '',
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          DTItem(
                            title: "ID",
                            value: widget.details.positionID ?? '',
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          DTItem(
                            title: "Commission",
                            value: widget.details.commission ?? '',
                          ),
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
