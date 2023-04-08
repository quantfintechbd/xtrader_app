import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/controller/quotes_controller.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/views/components/quotes_item_view.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../../../../utils/styles/k_colors.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    "Build".log();
    final controller = context.read(quotesProvider.notifier);

    return FocusDetector(
      onFocusLost: () {
        controller.stopTimer();
      },
      onFocusGained: () {
        controller.startTimer();
      },
      // onVisibilityLost: () {
      //   'Visibility Lost.'.log();
      //   '\nIt means the widget is no longer visible within your app.'.log();
      // },
      // onVisibilityGained: () {
      //   'Visibility Gained.'.log();
      //   '\nIt means the widget is now visible within your app.'.log();
      // },
      // onForegroundLost: () {
      //   'Foreground Lost.'.log();
      //   '\nIt means, for example, that the user sent your app to the '.log();
      //   'background by opening another app or turned off the device\'s '.log();
      //   'screen while your widget was visible.'.log();
      // },
      // onForegroundGained: () {
      //   'Foreground Gained.'.log();
      //   '\nIt means, for example, that the user switched back to your app '
      //       .log();
      //   'or turned the device\'s screen back on while your widget was '.log();
      //   'visible.'.log();
      // },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 25.h,
            ),
            Row(
              children: [
                Expanded(
                  child: GlobalText(
                    str: "SYMBOL",
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: KColor.stroke.color,
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  child: GlobalText(
                    str: "ASK",
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: KColor.stroke.color,
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  child: GlobalText(
                    str: "BID",
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: KColor.stroke.color,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: Consumer(builder: (context, ref, snapshot) {
                final state = ref.watch(quotesProvider);
                return state.isSymbols == true
                    ? state.data == null
                        ? Center(
                            child: centerCircularProgress(),
                          )
                        : ListView.builder(
                            itemCount: state.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              return QuotesItemView(quotes: state.data![index]);
                            })
                    : const Center(
                        child: GlobalText(
                          str: "You don't have any quotes!",
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
