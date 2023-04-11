import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/module/bottom_navigation/bottom_navigation_bar/controller/bottom_navigation_controller.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/model/quotes_details_response.dart';
import 'package:xtrader_app/utils/app_routes.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/styles/styles.dart';

import '../../../../../utils/navigation.dart';

class QuotesBottomSheet extends StatelessWidget {
  const QuotesBottomSheet({super.key, required this.quotes});
  final Quotes quotes;
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
                GlobalText(
                  str: quotes.symbol ?? '',
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                ),
                Spacer(),
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
            onTap: () {
              Navigation.pop(context);
              context.read(bottomNavigationProvider.notifier).changeTap(2);
              Navigation.push(context,
                  appRoutes: AppRoutes.newOrder,
                  arguments: quotes.symbol ?? '');
            },
            leading: GlobalSvgLoader(
              imagePath: KAssetName.bag.imagePath,
              svgFor: SvgFor.asset,
            ),
            title: GlobalText(
              str: "New Order",
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
            minLeadingWidth: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Divider(
              height: 1,
              color: KColor.separator.color,
            ),
          ),
          Consumer(builder: (context, ref, snapshot) {
            final bottomNavigation =
                ref.read(bottomNavigationProvider.notifier);
            return InkWell(
              onTap: () {
                Navigation.pop(context);
                bottomNavigation.showCharts(symbol: quotes.symbol ?? 'AUDCAD');
              },
              child: ListTile(
                leading: GlobalSvgLoader(
                  imagePath: KAssetName.barchart.imagePath,
                  svgFor: SvgFor.asset,
                ),
                title: GlobalText(
                  str: "Chart",
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
                minLeadingWidth: 10,
              ),
            );
          })
        ],
      ),
    );
  }
}
