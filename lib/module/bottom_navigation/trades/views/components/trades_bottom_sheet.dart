import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/utils/app_routes.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/navigation.dart';
import 'package:xtrader_app/utils/styles/styles.dart';

import '../../../../../global/widget/global_text.dart';

class TradesBottomSheet extends StatelessWidget {
  const TradesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: KColor.scafoldBg.color,
      decoration: BoxDecoration(
        color: KColor.popupBg.color,
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      height: context.height * 0.4,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "EURUSD,",
                        style: KTextStyle.customTextStyle(
                          color: KColor.textColorDark.color,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                      ),
                      TextSpan(
                        text: "Sell 0.01",
                        style: KTextStyle.customTextStyle(
                          color: KColor.textColorDark.color,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                GlobalText(
                  str: "5.07",
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    Navigation.pop(context);
                  },
                  child: GlobalSvgLoader(
                    imagePath: KAssetName.close.imagePath,
                    svgFor: SvgFor.asset,
                    color: KColor.scondaryTextColor.color,
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            color: KColor.separator.color,
          ),
          ListTile(
            title: GlobalText(
              str: "Close Postion",
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Divider(
              height: 1,
              color: KColor.separator.color,
            ),
          ),
          ListTile(
            title: InkWell(
              onTap: () {
                Navigation.push(context, appRoutes: AppRoutes.modifyPosition);
              },
              child: GlobalText(
                str: "Modify Position",
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
          ),
          ListTile(
            title: GlobalText(
              str: "New Order",
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
          ListTile(
            title: GlobalText(
              str: "Chart",
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
