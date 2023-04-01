import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/global/widget/global_textformfield.dart';
import 'package:xtrader_app/utils/styles/k_assets.dart';
import 'package:xtrader_app/utils/styles/k_colors.dart';
import 'package:xtrader_app/utils/styles/k_text_style.dart';

import 'components/login_button.dart';
import 'components/login_form_componnent.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: KColor.scafoldBg.color,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(KAssetName.logo.imagePath),
                  SizedBox(
                    height: 40.h,
                  ),
                  GlobalText(
                    str: "Welcome Back !",
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: KColor.textColorDark.color,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  GlobalText(
                    str: "Please login to continue",
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: KColor.textColorDark.color,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  LoginFormComponent(),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding:
              EdgeInsets.only(top: 16.h, bottom: 24.h, left: 20.w, right: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoginButton(),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Powered by\nM15 Platform v1.3.025 | Copywrite 2023 qTrader\n',
                      style: KTextStyle.customTextStyle(
                          color: KColor.scondaryTextColor.color),
                    ),
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Developed by ',
                          style: KTextStyle.customTextStyle(
                              color: KColor.scondaryTextColor.color),
                        ),
                        TextSpan(
                          text: 'Bangladesh IT',
                          style: KTextStyle.customTextStyle(
                              color: KColor.primary.color),
                        )
                      ],
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
