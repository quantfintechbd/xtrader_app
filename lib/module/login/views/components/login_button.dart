import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/module/login/controller/login_controller.dart';
import 'package:xtrader_app/utils/app_routes.dart';
import 'package:xtrader_app/utils/navigation.dart';

import '../../../../global/widget/global_button.dart';
import '../../../../utils/styles/k_colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Don’t have an account yet? ",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: KColor.textColorDark.color,
                    ),
                  ),
                  TextSpan(
                    text: 'Register Now ',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: KColor.secondary.color,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Consumer(builder: (context, ref, snap) {
          final state = ref.watch(loginProvider);
          final controller = ref.read(loginProvider.notifier);
          return GlobalButton(
            onPressed: state.isValid == true
                ? () {
                    controller.login(context);
                  }
                : null,
            buttonText: "Login Now",
            btnHeight: 65.h,
            roundedBorderRadius: 8,
            fontWeight: FontWeight.w700,
            textFontSize: 17,
          );
        }),
      ],
    );
  }
}
