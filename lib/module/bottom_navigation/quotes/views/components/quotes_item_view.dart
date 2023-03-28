import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/views/components/bottom_sheet.dart';
import 'package:xtrader_app/utils/styles/styles.dart';
import 'package:xtrader_app/utils/view_util.dart';

class QuotesItemView extends StatelessWidget {
  const QuotesItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        ViewUtil.bottomSheet(context: context, content: ItemBottomSheet());
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
                          str: "AUDCAD",
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: KColor.textColorDark.color,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        GlobalText(
                          str: "20 Mar, 17:48:51",
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          color: KColor.scondaryTextColor.color,
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
                          string: "10.28889",
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
                              str: "-0.00250",
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
                    width: 4.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ColordContainer(
                          color: KColor.primary.color,
                          string: "10.93032",
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
                              str: "-0.00250",
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
                right: 85.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: KColor.spaceCadet.color,
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GlobalText(
                      str: "99.99",
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
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        child: MultisizedText(
          text: string,
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
    return RichText(
      text: TextSpan(
        text: text.substring(0, 5),
        style: KTextStyle.customTextStyle(
          color: KColor.white.color,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: text.substring(text.length - 3, text.length - 1),
            style: KTextStyle.customTextStyle(
              color: KColor.white.color,
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: text.substring(text.length - 1, text.length),
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
/*Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalText(
                  str: "AUDCAD",
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: KColor.textColorDark.color,
                ),
                SizedBox(
                  height: 10.h,
                ),
                GlobalText(
                  str: "20 Mar, 17:48:51",
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: KColor.scondaryTextColor.color,
                ),
              ],
            )*/
