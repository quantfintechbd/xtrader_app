import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../global/widget/global_text.dart';
import '../../../../global/widget/global_textformfield.dart';
import '../../../../utils/styles/k_colors.dart';

class LoginFormComponent extends StatelessWidget {
  const LoginFormComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: KColor.white.color,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: KColor.stroke.color, width: 1),
          ),
          child: GlobalTextFormField(
            labelText: "User Id",
            textInputType: TextInputType.numberWithOptions(decimal: false),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your user id";
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: KColor.white.color,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: KColor.stroke.color, width: 1),
          ),
          child: GlobalTextFormField(
            labelText: "Password",
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your password";
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
