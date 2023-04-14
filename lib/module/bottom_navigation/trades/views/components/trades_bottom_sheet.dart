import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/controller/trades_controller.dart';
import 'package:xtrader_app/utils/app_routes.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/navigation.dart';
import 'package:xtrader_app/utils/styles/styles.dart';

import '../../../../../global/widget/global_text.dart';
import '../../../bottom_navigation_bar/controller/bottom_navigation_controller.dart';
import '../../model/trade_details_response.dart';

class TradesBottomSheet extends StatelessWidget {
  const TradesBottomSheet({super.key, required this.details});
  final TradeDetails details;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: KColor.scafoldBg.color,
      decoration: BoxDecoration(
        color: KColor.popupBg.color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.r),
          topLeft: Radius.circular(10.r),
        ),
      ),
      height: context.height * 0.45,
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
                        text: "${details.symbol ?? ''},",
                        style: KTextStyle.customTextStyle(
                          color: KColor.textColorDark.color,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                      ),
                      TextSpan(
                        text:
                            " ${details.action?.capitalize() ?? ''} ${details.volume ?? ''}",
                        style: KTextStyle.customTextStyle(
                          color: details.action?.toLowerCase() == 'buy'
                              ? KColor.primary.color
                              : KColor.red.color,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                GlobalText(
                  str: details.profit.toString().asCurrency,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: details.profit != null &&
                          details.profit!.parseToDouble() > 0.0 == true
                      ? KColor.primary.color
                      : KColor.red.color,
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
            title: Consumer(builder: (context, ref, snapshot) {
              final controller = ref.watch(tradesProvider.notifier);
              return InkWell(
                onTap: () {
                  controller.closeOrder(details.position ?? '', context);
                  Navigation.pop(context);
                },
                child: GlobalText(
                  str: "Close Postion",
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              );
            }),
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
                Navigation.pop(context);
                Navigation.push(context,
                    appRoutes: AppRoutes.modifyPosition, arguments: details);
              },
              child: GlobalText(
                str: "Modify Position",
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigation.pop(context);
              Navigation.push(context,
                  appRoutes: AppRoutes.newOrder,
                  arguments: details.symbol ?? '');
            },
            child: ListTile(
              title: GlobalText(
                str: "New Order",
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
          ),
          Consumer(builder: (context, ref, snapshot) {
            final bottomNavigation =
                ref.read(bottomNavigationProvider.notifier);

            return InkWell(
              onTap: () {
                Navigation.pop(context);
                bottomNavigation.showCharts(symbol: details.symbol ?? 'AUDCAD');
              },
              child: ListTile(
                title: GlobalText(
                  str: "Chart",
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
