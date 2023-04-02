import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/module/symbol/load_symbol/controller/load_symbol_controller.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/styles/k_colors.dart';

class LoadSymbolScreen extends StatelessWidget {
  const LoadSymbolScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read(loadSymbolProvider.notifier);
    controller.getTotalSymbolCount(context);
    return Scaffold(
        backgroundColor: KColor.scafoldBg.color,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                GlobalText(
                  str: "Loading Symbols...",
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Consumer(
                  builder: (context, ref, snap) {
                    final state = ref.watch(loadSymbolProvider);
                    return LinearProgressIndicator(
                      value: state.totalCount > 0
                          ? state.remoteSymbols.length / state.totalCount
                          : 0.0,
                      backgroundColor: KColor.reverseDark.color,
                      semanticsLabel: 'Linear progress indicator',
                    );
                  },
                ),
                Spacer(),
                Consumer(builder: (context, ref, snap) {
                  return GlobalText(
                    str:
                        "Loading ${ref.watch(loadSymbolProvider).endIndex} of ${ref.watch(loadSymbolProvider).totalCount} symbols",
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: KColor.scondaryTextColor.color,
                  );
                }),
              ],
            ),
          ),
        ));
  }
}
