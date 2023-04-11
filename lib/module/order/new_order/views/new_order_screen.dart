import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:intl/intl.dart';
import 'package:xtrader_app/global/widget/global_button.dart';
import 'package:xtrader_app/global/widget/global_dropdown.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/module/bottom_navigation/quotes/model/quotes_details_response.dart';
import 'package:xtrader_app/module/order/new_order/controller/new_order_controller.dart';
import 'package:xtrader_app/module/symbol/common_components/plus_minus_component.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../../../../global/widget/global_app_bar/global_appbar.dart';
import '../../../../utils/styles/styles.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../symbol/common_components/scale_component.dart';

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double? y;
}

class NewOrderScreen extends StatelessWidget {
  const NewOrderScreen({Key? key, required this.symbol}) : super(key: key);
  final String symbol;
  @override
  Widget build(BuildContext context) {
    final controller = context.read(newOrderProvider.notifier);
    final state = context.read(newOrderProvider);
    Future(
      () {
        controller.setdetails(symbol);
      },
    );

    return FocusDetector(
      onFocusLost: () {
        controller.stopTimer();
      },
      onFocusGained: () {
        controller.startTimer();
      },
      child: Scaffold(
        backgroundColor: KColor.scafoldBg.color,
        appBar: GlobalAppbar(
          isShowMenubar: false,
          title: symbol,
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
              Consumer(builder: (context, ref, snap) {
                final stateWatch = ref.watch(newOrderProvider);
                return GlobalDropdown(
                  validator: (p0) {
                    if (stateWatch.dropdownvalue?.isEmpty == true) {
                      return 'Order Excution Type is required';
                    }
                    return null;
                  },
                  hintText: "Order Excution Type",
                  items: state.items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Row(
                        children: [
                          Center(
                            child: GlobalText(
                              str: items,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: KColor.mineShaftCommmon.color,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (Object? str) {
                    if (str != null) {
                      controller.onchanged(str.toString());
                    }
                  },
                  value: state.items.first,
                );
              }),
              SizedBox(
                height: 20.h,
              ),
              ScaleComponent(controller: state.orderSize),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Consumer(builder: (context, ref, snapshot) {
                    final state = ref.watch(newOrderProvider);
                    return GlobalText(
                      str: state.quotes?.ask ?? '',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: KColor.red.color,
                    );
                  }),
                  Spacer(),
                  Consumer(builder: (context, ref, snapshot) {
                    final state = ref.watch(newOrderProvider);
                    return GlobalText(
                      str: state.quotes?.bid ?? '',
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
              Consumer(builder: (context, ref, snapshot) {
                final state = ref.watch(newOrderProvider);
                return state.dropdownvalue != 'Instant Execution'
                    ? Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          PlusMinusComponent(
                            hintText: "Price",
                            controller: state.priceController,
                            value: state.quotes?.priceClose
                                    .toString()
                                    .parseToDouble() ??
                                0.0,
                          ),
                        ],
                      )
                    : Container();
              }),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Consumer(builder: (context, ref, snapshot) {
                      final state = ref.watch(newOrderProvider);
                      return PlusMinusComponent(
                        hintText: "SL",
                        controller: state.slController,
                        value: state.quotes?.ask?.toString().parseToDouble() ??
                            0.0,
                      );
                    }),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Consumer(builder: (context, ref, snapshot) {
                      final state = ref.watch(newOrderProvider);
                      return PlusMinusComponent(
                        hintText: "T/P",
                        controller: state.tpController,
                        value: state.quotes?.bid?.toString().parseToDouble() ??
                            0.0,
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: Consumer(
                  builder: (context, ref, snapshot) {
                    final dataState = ref.watch(newOrderProvider);
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
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SafeArea(
                child: Consumer(builder: (context, ref, snapshot) {
                  final state = ref.watch(newOrderProvider);
                  return Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: GlobalButton(
                          onPressed: state.isValid
                              ? () {
                                  controller.newOrder(context, action: 'Buy');
                                }
                              : null,
                          buttonText: "Buy",
                          btnHeight: 55,
                          roundedBorderRadius: 8,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Flexible(
                        flex: 1,
                        child: GlobalButton(
                          onPressed: state.isValid
                              ? () {
                                  controller.newOrder(context, action: 'Sell');
                                }
                              : null,
                          buttonText: "Sell",
                          btnHeight: 55,
                          roundedBorderRadius: 8,
                          btnBackgroundActiveColor: KColor.red.color,
                        ),
                      ),
                    ],
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
