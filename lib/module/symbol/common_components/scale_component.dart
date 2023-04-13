import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/module/symbol/common_components/plus_minus_component.dart';
import 'package:xtrader_app/utils/extension.dart';

import 'gradiant_box.dart';

class ScaleComponent extends StatelessWidget {
  const ScaleComponent({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              calculate("-0.1");
            },
            child: GradiantBox(
              text: "-0.1",
              radius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              calculate("-0.01");
            },
            child: const GradiantBox(
              text: "-0.01",
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: OrderTextField(
            hintText: 'Volume',
            controller: controller,
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              calculate("0.01");
            },
            child: const GradiantBox(
              text: "+0.01",
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              calculate("0.1");
            },
            child: GradiantBox(
              text: "+0.1",
              radius: BorderRadius.only(
                topRight: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void calculate(String value) {
    controller.text = (controller.text.parseToDouble() + value.parseToDouble())
        .toStringAsFixed(2);
  }
}
