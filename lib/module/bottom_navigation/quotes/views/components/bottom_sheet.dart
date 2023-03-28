import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/styles/k_assets.dart';
import 'package:xtrader_app/utils/styles/styles.dart';

import '../../../../../utils/navigation.dart';

class ItemBottomSheet extends StatelessWidget {
  const ItemBottomSheet({super.key});

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
                  str: "AUDCAD",
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
            leading: GlobalSvgLoader(
              imagePath: KAssetName.bag.imagePath,
              svgFor: SvgFor.asset,
            ),
            title: GlobalText(
              str: "New Order",
              fontWeight: FontWeight.w500,
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
          ListTile(
            leading: GlobalSvgLoader(
              imagePath: KAssetName.barchart.imagePath,
              svgFor: SvgFor.asset,
            ),
            title: GlobalText(
              str: "Chart",
              fontWeight: FontWeight.w500,
            ),
            minLeadingWidth: 10,
          )
        ],
      ),
    );
  }
}
