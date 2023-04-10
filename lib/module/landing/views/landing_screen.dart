import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xtrader_app/global/widget/global_button.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/utils/app_routes.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/navigation.dart';
import 'package:xtrader_app/utils/styles/k_assets.dart';
import 'package:xtrader_app/utils/styles/k_colors.dart';
import 'package:xtrader_app/utils/styles/k_text_style.dart';

import '../../../global/widget/global_text.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            // child: Image.asset(
            //   KAssetName.landingBackground.imagePath,
            //   fit: BoxFit.fill,
            // ),
            child: GlobalSvgLoader(
              imagePath: KAssetName.landingBackground.imagePath,
              svgFor: SvgFor.asset,
              fit: BoxFit.fitWidth,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Trade on Forex',
                          style: KTextStyle.customTextStyle(
                              color: KColor.textColorDark.color,
                              fontWeight: FontWeight.w600,
                              fontSize: 34.sp),
                        ),
                        TextSpan(
                          text: '\nlike an expert',
                          style: KTextStyle.customTextStyle(
                              color: KColor.primary.color,
                              fontWeight: FontWeight.w700,
                              fontSize: 34.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  SizedBox(
                    width: 300.w,
                    child: GlobalText(
                      str:
                          "Stay up to date and trade smart with the most relevant live data",
                      fontWeight: FontWeight.w400,
                      color: KColor.scondaryTextColor.color,
                      fontSize: 16.sp,
                    ),
                  ),
                  Spacer(),
                  GlobalButton(
                    onPressed: () {
                      Navigation.pushAndRemoveUntil(context,
                          appRoutes: AppRoutes.login);
                    },
                    buttonText: "Get Started",
                    btnHeight: 55.h,
                    roundedBorderRadius: 8,
                    textFontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
