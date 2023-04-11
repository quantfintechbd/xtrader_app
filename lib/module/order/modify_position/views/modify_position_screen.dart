import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:intl/intl.dart';
import 'package:xtrader_app/global/widget/global_button.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/module/bottom_navigation/trades/model/trade_details_response.dart';
import 'package:xtrader_app/module/symbol/common_components/plus_minus_component.dart';
import 'package:xtrader_app/module/order/modify_position/controller/modify_position_controller.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../../../../global/widget/global_app_bar/global_appbar.dart';
import '../../../../utils/styles/styles.dart';
import '../../../symbol/common_components/scale_component.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double? y;
}

class ModifyPositionScreen extends StatelessWidget {
  const ModifyPositionScreen({Key? key, required this.details})
      : super(key: key);
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

    return Scaffold(
      backgroundColor: KColor.scafoldBg.color,
      appBar: GlobalAppbar(
        isShowMenubar: false,
        title: details.symbol,
        isLeading: true,
        centerTitle: false,
      ),
      body: FocusDetector(
        onFocusLost: () {
          controller.stopTimer();
        },
        onFocusGained: () {
          controller.startTimer();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              ScaleComponent(
                controller: state.volumeController,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Consumer(builder: (context, ref, snapshot) {
                    final state = ref.watch(modifyPostionProvider);
                    return GlobalText(
                      str: state.quotes?.ask?.asCurrency ?? '',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: KColor.red.color,
                    );
                  }),
                  Spacer(),
                  Consumer(builder: (context, ref, snapshot) {
                    final state = ref.watch(modifyPostionProvider);
                    return GlobalText(
                      str: state.quotes?.bid?.asCurrency ?? '',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: KColor.primary.color,
                    );
                  }),
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
                    child: Consumer(builder: (context, ref, snapshot) {
                      final state = ref.watch(modifyPostionProvider);
                      return PlusMinusComponent(
                        hintText: "SL",
                        controller: state.slController,
                        value: state.quotes?.ask?.parseToDouble() ?? 0.0,
                      );
                    }),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Consumer(builder: (context, ref, snapshot) {
                      final state = ref.watch(modifyPostionProvider);
                      return PlusMinusComponent(
                        hintText: "T/P",
                        controller: state.tpController,
                        value: state.quotes?.bid?.parseToDouble() ?? 0.0,
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Expanded(
                child: Consumer(
                  builder: (context, ref, snapshot) {
                    final dataState = ref.watch(modifyPostionProvider);
                    return dataState.dataset.isNotEmpty
                        ? LineChart(
                            LineChartData(
                              titlesData: FlTitlesData(
                                leftTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                rightTitles: AxisTitles(
                                  drawBehindEverything: false,
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      return GlobalText(
                                          str: value
                                              .toStringAsFixed(5)
                                              .substring(0, 7),
                                          fontWeight: FontWeight.w500);
                                    },
                                    reservedSize: 55,
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                topTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  dotData: FlDotData(
                                    show: false,
                                  ),
                                  color: KColor.red.color,
                                  spots: dataState.dataset
                                      .map((point) =>
                                          FlSpot(point.time, point.ask))
                                      .toList(),
                                ),
                                LineChartBarData(
                                  dotData: FlDotData(
                                    show: false,
                                  ),
                                  color: KColor.primary.color,
                                  spots: dataState.dataset
                                      .map((point) =>
                                          FlSpot(point.time, point.bid))
                                      .toList(),
                                ),
                              ],
                            ),
                          )
                        : Container();
                    /*SfCartesianChart(
                      primaryXAxis: DateTimeAxis(),
                      //https://help.syncfusion.com/flutter/cartesian-charts/chart-types/candle-chart
                      series: <ChartSeries>[
                        CandleSeries<Quotes, DateTime>(
                          bullColor: KColor.primary.color,
                          dataSource: dataState.dataset,
                          xValueMapper: (Quotes data, _) =>
                              DateFormat("dd/MM HH:mm:ss").parse(data.time ?? ''),
                          lowValueMapper: (Quotes data, _) =>
                              data.askLow.toString().parseToDouble(),
                          highValueMapper: (Quotes data, _) =>
                              data.askHigh.toString().parseToDouble(),
                          openValueMapper: (Quotes data, _) =>
                              data.priceOpen.toString().parseToDouble(),
                          closeValueMapper: (Quotes data, _) =>
                              data.priceClose.toString().parseToDouble(),
                        ),
                        CandleSeries<Quotes, DateTime>(
                          bullColor: KColor.red.color,
                          dataSource: dataState.dataset,
                          xValueMapper: (Quotes data, _) =>
                              DateFormat("dd/MM HH:mm:ss").parse(data.time ?? ''),
                          lowValueMapper: (Quotes data, _) =>
                              data.bidLow.toString().parseToDouble(),
                          highValueMapper: (Quotes data, _) =>
                              data.bidHigh.toString().parseToDouble(),
                          openValueMapper: (Quotes data, _) =>
                              data.priceOpen.toString().parseToDouble(),
                          closeValueMapper: (Quotes data, _) =>
                              data.priceClose.toString().parseToDouble(),
                        )
                      ],
                    );*/
                  },
                ),
              ),
              SizedBox(
                height: 40.h,
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
      ),
    );
  }
}
