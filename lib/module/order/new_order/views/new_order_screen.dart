import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_button.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_details_response.dart';
import 'package:xtrader_app/module/symbol/common_components/plus_minus_component.dart';
import 'package:xtrader_app/module/order/modify_position/controller/modify_position_controller.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../../../../global/widget/global_appbar.dart';
import '../../../../utils/styles/styles.dart';
import '../../../symbol/common_components/scale_component.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double? y;
}

class NewOrderScreen extends StatelessWidget {
  const NewOrderScreen({Key? key, required this.details}) : super(key: key);
  final TradeDetails details;
  @override
  Widget build(BuildContext context) {
    final controller = context.read(modifyPostionProvider.notifier);
    final state = context.read(modifyPostionProvider);
    Future(
      () {
        controller.setdetails(details);
      },
    );
    final List<ChartData> chartData1 = [
      ChartData(2010, 35),
      ChartData(2011, 13),
      ChartData(2012, 34),
      ChartData(2013, 27),
      ChartData(2014, 40)
    ];
    final List<ChartData> chartData2 = [
      ChartData(2010, 40),
      ChartData(2011, 10),
      ChartData(2012, 87),
      ChartData(2013, 62),
      ChartData(2014, 20)
    ];

    return Scaffold(
      backgroundColor: KColor.scafoldBg.color,
      appBar: GlobalAppbar(
        isShowMenubar: false,
        title: details.symbol,
        isLeading: true,
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            ScaleComponent(
              midValue: details.volume.toString().parseToDouble().toString(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                GlobalText(
                  str: details.sL ?? '',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: KColor.red.color,
                ),
                Spacer(),
                GlobalText(
                  str: details.tP ?? '',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: KColor.primary.color,
                ),
                SizedBox(
                  width: 20.w,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: PlusMinusComponent(
                    hintText: "SL",
                    controller: state.slController,
                    value: details.sL?.parseToDouble() ?? 0.0,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: PlusMinusComponent(
                    hintText: "T/P",
                    controller: state.tpController,
                    value: details.tP?.parseToDouble() ?? 0.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: SfCartesianChart(
                series: <ChartSeries>[
                  SplineSeries<ChartData, int>(
                    dataSource: chartData1,
                    // Type of spline
                    color: KColor.primary.color,
                    splineType: SplineType.cardinal,
                    cardinalSplineTension: 0.9,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                  ),
                  SplineSeries<ChartData, int>(
                    dataSource: chartData2,
                    // Type of spline
                    color: KColor.red.color,
                    splineType: SplineType.cardinal,
                    cardinalSplineTension: 0.9,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SafeArea(
              child: Consumer(builder: (context, ref, snapshot) {
                final state = ref.watch(modifyPostionProvider);
                return GlobalButton(
                  onPressed: state.slController.text.isNotEmpty &&
                          state.tpController.text.isNotEmpty
                      ? () {
                          controller.modifyResponse(context);
                        }
                      : null,
                  buttonText: "Modify",
                  btnHeight: 55,
                  roundedBorderRadius: 8,
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
