import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:xtrader_app/global/widget/global_button.dart';
import 'package:xtrader_app/global/widget/global_dropdown.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/module/order/new_order/controller/new_order_controller.dart';
import 'package:xtrader_app/module/symbol/common_components/plus_minus_component.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../../../../global/widget/global_appbar.dart';
import '../../../../utils/styles/styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
                  final state = ref.watch(newOrderProvider);
                  return Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: GlobalButton(
                          onPressed: state.isValid
                              ? () {
                                  controller.newOrder(context, action: 'buy');
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
                                  controller.newOrder(context, action: 'sell');
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
