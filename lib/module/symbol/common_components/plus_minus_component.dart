import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../../../../../utils/styles/styles.dart';
import 'gradiant_box.dart';

class PlusMinusComponent extends StatefulWidget {
  PlusMinusComponent({
    super.key,
    required this.hintText,
    required this.controller,
    required this.value,
  });
  final String hintText;
  double value;
  final TextEditingController controller;
  @override
  State<PlusMinusComponent> createState() => _PlusMinusComponentState();
}

class _PlusMinusComponentState extends State<PlusMinusComponent> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                setState(() {
                  final double currentValue = widget.controller.text.isNotEmpty
                      ? widget.controller.text.parseToDouble()
                      : widget.value;
                  final double newValue = currentValue - 0.00001;
                  widget.controller.text = newValue.toStringAsFixed(5);
                });
              },
              child: GradiantBox(
                text: "-",
                radius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    bottomLeft: Radius.circular(8.r)),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: OrderTextField(
              hintText: widget.hintText,
              controller: widget.controller,
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                setState(() {
                  final double currentValue = widget.controller.text.isNotEmpty
                      ? widget.controller.text.parseToDouble()
                      : widget.value;
                  final double newValue = currentValue + 0.00001;
                  widget.controller.text = newValue.toStringAsFixed(5);
                });
              },
              child: GradiantBox(
                text: "+",
                radius: BorderRadius.only(
                    topRight: Radius.circular(8.r),
                    bottomRight: Radius.circular(8.r)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderTextField extends StatelessWidget {
  const OrderTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 45.h,
      decoration: BoxDecoration(
        color: KColor.white.color,
        border: Border.symmetric(
            horizontal: BorderSide(color: KColor.stroke.color, width: 1.h)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
/*
GlobalText(
                str: widget.value == 0
                    ? widget.hintText
                    : widget.value.toString(),
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: widget.value == 0
                    ? KColor.textHintColor.color
                    : KColor.mineShaftCommmon.color,
                textAlign: TextAlign.center,
              ),
*/