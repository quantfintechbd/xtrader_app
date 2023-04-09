import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/utils/enum.dart';
import '../../../constant/constant_key.dart';
import '../../../utils/navigation.dart';
import '../../../utils/styles/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? titleWidget;
  final bool isToShowElevation;
  final bool isShowMenubar;
  final bool? centerTitle;
  final bool isLeading;
  final Color? backgroundColor;
  final void Function()? backActionOverride;
  GlobalAppbar({
    Key? key,
    this.title,
    this.actions,
    this.isToShowElevation = true,
    required this.isShowMenubar,
    this.centerTitle,
    this.isLeading = false,
    this.backActionOverride,
    this.titleWidget,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: isToShowElevation ? 0.5.h : 0,
      shadowColor: KColor.stroke.color,
      backgroundColor: backgroundColor ?? KColor.primary.color,
      leadingWidth: isShowMenubar ? 0 : null,
      toolbarHeight: 65.h,
      title: isShowMenubar == true
          ? Row(
              children: [
                InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: GlobalSvgLoader(
                    svgFor: SvgFor.asset,
                    imagePath: KAssetName.menu.imagePath,
                    height: 35.h,
                    width: 35.w,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                titleWidget ??
                    GlobalText(
                      str: title ?? "",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: KColor.white.color,
                    ),
              ],
            )
          : GlobalText(
              str: title ?? "",
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              fontFamily: AppConstant.FONTFAMILY.key,
              color: KColor.white.color,
            ),
      centerTitle: centerTitle,
      leading: isLeading == false
          ? GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Padding(
                  padding: EdgeInsets.only(top: 5.h), child: SizedBox()),
            )
          : GestureDetector(
              onTap: backActionOverride == null
                  ? () {
                      Navigation.pop(context);
                    }
                  : backActionOverride,
              child: Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: GlobalSvgLoader(
                  imagePath: KAssetName.backArrow.imagePath,
                  svgFor: SvgFor.asset,
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(isShowMenubar == true ? 60.h : 56.h);
}
