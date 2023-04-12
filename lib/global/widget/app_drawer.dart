import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/constant/constant_key.dart';
import 'package:xtrader_app/data_provider/pref_helper.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/module/bottom_navigation/bottom_navigation_bar/controller/bottom_navigation_controller.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/controller/quotes_controller.dart';
import 'package:xtrader_app/utils/app_routes.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/navigation.dart';
import 'package:xtrader_app/utils/styles/styles.dart';
import 'package:xtrader_app/utils/theme/theme_controller.dart';
import 'package:xtrader_app/utils/theme/theme_util.dart';

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
                str: PrefHelper.getString(AppConstant.NAME.key),
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
              accountEmail: GlobalText(
                str: PrefHelper.getString(AppConstant.USER_NAME.key),
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
              onTap: () {
                Navigation.pop(context);
                context.read(bottomNavigationProvider.notifier).changeTap(2);
              },
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
              trailing: Consumer(
                builder: (context, ref, snap) {
                  final state = ref.watch(themeProvider);
                  final themeController = ref.read(themeProvider.notifier);
                  return Switch(
                    activeColor: KColor.primary.color,
                    inactiveThumbColor: KColor.primary.color,
                    inactiveTrackColor: KColor.primary.color.withOpacity(0.5),
                    onChanged: (bool value) {
                      themeController.setTheme(
                          value ? XtraderTheme.light : XtraderTheme.dark);
                    },
                    value: state.theme == XtraderTheme.light,
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {
                context.read(quotesProvider.notifier).shouldLoadData = false;
                Navigation.pop(context);

                Navigation.pushAndRemoveUntil(context,
                    appRoutes: AppRoutes.login);
              },
              child: ListTile(
                leading: GlobalSvgLoader(
                  imagePath: KAssetName.logout.imagePath,
                  svgFor: SvgFor.asset,
                ),
                minLeadingWidth: 10,
                title: GlobalText(
                  str: "Logout",
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: KColor.red.color,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
