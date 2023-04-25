import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/model/quotes_details_response.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/views/components/bottom_sheet.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/styles/styles.dart';
import 'package:xtrader_app/utils/view_util.dart';

import 'colored_container.dart';

class QuotesItemView extends StatelessWidget {
  const QuotesItemView(
      {super.key,
      required this.quotes,
      required this.askColor,
      required this.bidColor});
  final Color askColor, bidColor;
  final Quotes quotes;
  @override
  Widget build(context) {
    return InkWell(
      onLongPress: () {
        ViewUtil.bottomSheet(
            context: context,
            content: QuotesBottomSheet(
              quotes: quotes,
            ));
      },
      child: Column(
        children: [
          SizedBox(
            height: 8.h,
          ),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GlobalText(
                          str: quotes.symbol ?? '',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color:
                              Theme.of(context).textTheme.displayLarge?.color,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        GlobalText(
                          str: quotes.time ?? '',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          color:
                              Theme.of(context).textTheme.displaySmall?.color,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ColordContainer(
                          color: bidColor,
                          string: quotes.bid ?? '',
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            GlobalText(
                              str: "Low:",
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: KColor.scondaryTextColor.color,
                            ),
                            Spacer(),
                            GlobalText(
                              str: quotes.bidLow ?? '',
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: KColor.scondaryTextColor.color,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ColordContainer(
                          color: askColor,
                          string: quotes.ask ?? '',
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            GlobalText(
                              str: "High:",
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: KColor.scondaryTextColor.color,
                              textAlign: TextAlign.left,
                            ),
                            Spacer(),
                            GlobalText(
                              str: quotes.askHigh ?? '',
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: KColor.scondaryTextColor.color,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 15.h,
                right: 90.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: KColor.spaceCadet.color,
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GlobalText(
                      str: quotes.difference ?? '',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Divider(
            height: 1,
            color: KColor.stroke.color,
          )
        ],
      ),
    );
  }
}
