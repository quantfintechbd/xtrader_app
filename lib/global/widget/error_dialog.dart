import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_button.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/utils/navigation.dart';

import '../../utils/styles/styles.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    Key? key,
    required this.erroMsg,
    this.title,
    this.titleColor,
    this.callbackAction,
  }) : super(key: key);

  final String erroMsg;
  final String? title;
  final Color? titleColor;
  final Function(void)? callbackAction;
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 20.w),
                child: GlobalText(
                  str: title ?? "Error!",
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: titleColor ?? KColor.red.color,
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigation.pop(Navigation.key.currentContext);
                  if (callbackAction != null) {
                    callbackAction!;
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 20.w, top: 20.w),
                  child: const Icon(Icons.close),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.w,
                        ),
                        child: GlobalText(
                          str: erroMsg,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff999999),
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                GlobalButton(
                  buttonText: "Okay",
                  onPressed: () {
                    Navigation.pop(context);
                  },
                  btnHeight: 55,
                  roundedBorderRadius: 8,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
/*
List.generate(
              erroMsg.length,
              (index) => 
            ),
            */