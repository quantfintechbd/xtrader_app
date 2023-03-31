import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_appbar.dart';
import 'package:xtrader_app/global/widget/global_button.dart';
import 'package:xtrader_app/global/widget/global_dropdown.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/module/symbol/buy_sell/views/components/gradiant_box.dart';
import 'package:xtrader_app/module/symbol/buy_sell/views/components/plus_minus_component.dart';
import 'package:xtrader_app/utils/styles/styles.dart';

import 'components/scale_component.dart';

class BuySellScreen extends StatelessWidget {
  const BuySellScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.scafoldBg.color,
      appBar: GlobalAppbar(
        isShowMenubar: false,
        title: "Add Symbol",
        isLeading: true,
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            /*SizedBox(
              height: 20.h,
            ),
            Flex(
              direction: Axis.vertical,
              children: [
                GlobalDropdown(
                  validator: null,
                  hintText: "Instant Execution",
                  onChanged: (value) {},
                  items: ["hello, world", "how are you", "goodbye"]
                      .map<DropdownMenuItem<String>>((String _value) =>
                          DropdownMenuItem<String>(
                              value:
                                  _value, // add this property an pass the _value to it
                              child: GlobalText(
                                str: _value,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: KColor.mineShaftCommmon.color,
                              )))
                      .toList(),
                ),
              ],
            ),*/
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
            Spacer(),
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
