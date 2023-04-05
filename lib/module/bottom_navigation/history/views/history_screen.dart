import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/module/bottom_navigation/history/controller/history_controller.dart';
import 'package:xtrader_app/module/bottom_navigation/history/views/components/history_item_view.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../../../../global/widget/global_text.dart';
import '../../../../utils/styles/k_colors.dart';
import '../../trades/views/components/summery_item_view.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final state = ref.watch(historyProvider);
    return RefreshIndicator(
      onRefresh: () => context.read(historyProvider.notifier).refresh(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: context.height * 0.25,
              child: state.isLoading
                  ? Center(
                      child: centerCircularProgress(
                          progressColor: KColor.primary.color),
                    )
                  : ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        for (int x = 0;
                            x < state.historySummery.entries.length;
                            x++) ...[
                          SummeryItemView(
                            title: state.historySummery.keys
                                .toList()[x]
                                .capitalize(),
                            value: state.historySummery.keys
                                .toList()[x]
                                .toString()
                                .asCurrency,
                          ),
                        ],
                      ],
                    ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              color: context.theme.colorScheme.tertiaryContainer,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
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
            state.isLoading
                ? Center(
                    child: centerCircularProgress(
                        progressColor: KColor.primary.color),
                  )
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.details.length,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return HistoryItemView(
                        details: state.details[index],
                      );
                    }),
                  ),
          ],
        ),
      ),
    );
  }
}
