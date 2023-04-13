import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/constant/app_url.dart';
import 'package:xtrader_app/global/widget/global_image_loader.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/module/login/controller/login_controller.dart';
import 'package:xtrader_app/module/login/views/components/broker_selection.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/styles/k_assets.dart';
import 'package:xtrader_app/utils/styles/k_text_style.dart';
import 'package:xtrader_app/utils/view_util.dart';

import '../../../../global/widget/global_text.dart';
import '../../../../global/widget/global_textformfield.dart';
import '../../../../utils/styles/k_colors.dart';

class LoginFormComponent extends ConsumerWidget {
  const LoginFormComponent({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final state = ref.watch(loginProvider);
    final controller = ref.read(loginProvider.notifier);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: KColor.white.color,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: KColor.stroke.color, width: 1),
          ),
          child: InkWell(
            onTap: () {
              ViewUtil.bottomSheet(
                  context: context, content: BrokerSelectionSheet());
            },
            child: Row(
              children: [
                state.selectedBroker == null
                    ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: GlobalText(
                          str: "Select Broker",
                          fontWeight: FontWeight.w500,
                          color: KColor.textHintColor.color,
                          fontSize: 15.sp,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlobalText(
                            str: "Select Broker",
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: KColor.primary.color,
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              GlobalImageLoader(
                                imagePath:
                                    "${AppUrl.baseImage.url}${state.selectedBroker?.icon}",
                                imageFor: ImageFor.network,
                                width: 26,
                                height: 26,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              GlobalText(
                                str: state.selectedBroker?.name ?? '',
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: KColor.ob1a31.color,
                              ),
                            ],
                          ),
                        ],
                      ),
                Spacer(),
                GlobalSvgLoader(
                    imagePath: KAssetName.arrowDown.imagePath,
                    svgFor: SvgFor.asset),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Focus(
          onFocusChange: (value) {
            controller.changeUserIdFocus(value);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: KColor.white.color,
              borderRadius: BorderRadius.circular(8.r),
              border: state.isUserIdFocued
                  ? Border.all(color: KColor.primary.color)
                  : Border.all(color: KColor.stroke.color, width: 1),
            ),
            child: GlobalTextFormField(
              controller: state.userIdController,
              labelText: "User Id",
              labelStyle: state.isUserIdFocued
                  ? KTextStyle.customTextStyle(
                      color: KColor.primary.color,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500)
                  : null,
              textInputType: TextInputType.numberWithOptions(decimal: false),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your user id";
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Focus(
          onFocusChange: (value) {
            controller.changePasswordFocus(value);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: KColor.white.color,
              borderRadius: BorderRadius.circular(8.r),
              border: state.isPasswordFocused
                  ? Border.all(color: KColor.primary.color)
                  : Border.all(color: KColor.stroke.color, width: 1),
            ),
            child: Consumer(
              builder: (context, ref, snapshot) {
                final state = ref.watch(loginProvider);
                final controller = ref.read(loginProvider.notifier);
                return GlobalTextFormField(
                  labelText: "Password",
                  labelStyle: state.isPasswordFocused
                      ? KTextStyle.customTextStyle(
                          color: KColor.primary.color,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500)
                      : null,
                  controller: state.passwordController,
                  obscureText: !state.shouldShowPassword,
                  suffixIcon: InkWell(
                    onTap: () {
                      controller.changePasswordState();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GlobalSvgLoader(
                        imagePath: state.shouldShowPassword
                            ? KAssetName.eyeOff.imagePath
                            : KAssetName.eyeOpen.imagePath,
                        svgFor: SvgFor.asset,
                        color: KColor.stroke.color,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GlobalText(
              str: "Forgot Password?",
              fontWeight: FontWeight.w500,
              fontSize: 14,
              decoration: TextDecoration.underline,
            )
          ],
        ),
      ],
    );
  }
}
