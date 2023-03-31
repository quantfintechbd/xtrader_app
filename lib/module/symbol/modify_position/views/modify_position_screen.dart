import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_button.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/module/symbol/common_components/plus_minus_component.dart';

import '../../../../global/widget/global_appbar.dart';
import '../../../../utils/styles/styles.dart';
import '../../common_components/scale_component.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double? y;
}

class ModifyPositionScreen extends StatelessWidget {
  const ModifyPositionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title: "AUDCAD",
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
            ScaleComponent(),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                GlobalText(
                  str: "0.93048",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: KColor.red.color,
                ),
                Spacer(),
                GlobalText(
                  str: "0.93048",
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
                  controller: TextEditingController(),
                )),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: PlusMinusComponent(
                    hintText: "SL",
                    controller: TextEditingController(),
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
              child: GlobalButton(
                onPressed: () {},
                buttonText: "Modify",
                btnHeight: 55,
                roundedBorderRadius: 8,
              ),
            )
          ],
        ),
      ),
    );
  }
}
