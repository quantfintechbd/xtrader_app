import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/styles/styles.dart';

class GlobalAppDrawer extends StatelessWidget {
  const GlobalAppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: KColor.popupBg.color,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: KColor.popupBg.color,
              ),
              accountName: GlobalText(
                str: "Abdullah Al Mahmud",
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
              accountEmail: GlobalText(
                str: "4006",
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
              currentAccountPicture: CircleAvatar(
                radius: 20,
                child: Icon(
                  Icons.account_circle_rounded,
                  color: KColor.textColorDark.color,
                  size: 40,
                ),
              ),
              currentAccountPictureSize: Size.fromRadius(20),
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              height: 1,
              color: KColor.separator.color,
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: GlobalText(
                str: "Account",
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: KColor.sixA6a6a.color,
              ),
            ),
            ListTile(
              leading: GlobalSvgLoader(
                  imagePath: KAssetName.upArrow.imagePath,
                  svgFor: SvgFor.asset),
              title: GlobalText(
                str: "Trade Now",
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
              minLeadingWidth: 10,
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              height: 1,
              color: KColor.separator.color,
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: GlobalText(
                str: "System",
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: KColor.sixA6a6a.color,
              ),
            ),
            ListTile(
              leading: GlobalSvgLoader(
                  imagePath: KAssetName.moon.imagePath, svgFor: SvgFor.asset),
              title: GlobalText(
                str: "Light Mode",
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
              minLeadingWidth: 10,
              trailing: Switch(
                activeColor: KColor.textColorDark.color,
                onChanged: (bool value) {},
                value: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
