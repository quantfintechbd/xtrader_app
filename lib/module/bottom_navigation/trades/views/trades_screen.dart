import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:xtrader_app/global/widget/global_text.dart';

import 'package:xtrader_app/module/bottom_navigation/trades/controller/trades_controller.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/views/components/trades_item_view.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/styles/styles.dart';

import 'components/summery_item_view.dart';

class TradesScreen extends StatelessWidget {
  const TradesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read(tradesProvider.notifier);
    return FocusDetector(
      onFocusGained: () {
        controller.refresh();
      },
      onFocusLost: () {
        controller.stopLoading();
      },
      child: RefreshIndicator(
        onRefresh: () async {
          controller.refresh();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: context.height * 0.25,
                child: Consumer(builder: (context, ref, snapshot) {
                  final state = ref.watch(tradesProvider);
                  return state.tradePositionData.isEmpty
                      ? Center(
                          child: centerCircularProgress(
                              progressColor: KColor.primary.color),
                        )
                      : ListView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            for (int x = 0;
                                x < state.tradePositionData.entries.length;
                                x++) ...[
                              SummeryItemView(
                                  title: state.tradePositionData.keys
                                      .toList()[x]
                                      .toString(),
                                  value: state.tradePositionData.values
                                      .toList()[x]
                                      .toString()
                                      .asCurrency //"69 943.20",
                                  ),
                            ],
                          ],
                        );
                }),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                color: context.theme.colorScheme.tertiaryContainer,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                  child: GlobalText(
                      str: "Positions",
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: KColor.textHintColor.color),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Consumer(builder: (context, ref, snapshot) {
                final dataState = ref.watch(tradesProvider);
                return dataState.tradeDetails?.isEmpty == true
                    ? Center(
                        child: centerCircularProgress(
                            progressColor: KColor.primary.color),
                      )
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: dataState.tradeDetails?.length ?? 0,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return TradesItemView(
                            tradeDetails: dataState.tradeDetails![index],
                          );
                        }),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
