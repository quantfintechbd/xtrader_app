import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/model/quotes_details_response.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/views/components/bottom_sheet.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/styles/styles.dart';
import 'package:xtrader_app/utils/view_util.dart';

class QuotesItemView extends StatelessWidget {
  const QuotesItemView({super.key, required this.quotes});
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
                          color: KColor.red.color,
                          string: quotes.ask ?? '',
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
                              str: quotes.askLow ?? '',
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
                          color: KColor.primary.color,
                          string: quotes.bid ?? '',
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            GlobalText(
                              str: "  High:",
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: KColor.scondaryTextColor.color,
                              textAlign: TextAlign.left,
                            ),
                            Spacer(),
                            GlobalText(
                              str: quotes.bidHigh ?? '',
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
                bottom: 12.h,
                right: 80.w,
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

class ColordContainer extends StatelessWidget {
  const ColordContainer({
    super.key,
    required this.color,
    required this.string,
  });
  final Color color;
  final String string;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(4.r)),
      child: Padding(
        padding: EdgeInsets.only(top: 6, bottom: 15, right: 20.w, left: 20.w),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: MultisizedText(
            text: string,
          ),
        ),
      ),
    );
  }
}

class MultisizedText extends StatelessWidget {
  const MultisizedText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    String newText = text.parseToDouble().toStringAsFixed(5);

    return RichText(
      text: TextSpan(
        text: newText.substring(0, 5),
        style: KTextStyle.customTextStyle(
          color: KColor.white.color,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: newText.substring(newText.length - 3, newText.length - 1),
            style: KTextStyle.customTextStyle(
              color: KColor.white.color,
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: newText.substring(newText.length - 1, newText.length),
            style: KTextStyle.customTextStyle(
              color: KColor.white.color,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
