import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/global/widget/global_textformfield.dart';

import '../../../../global/widget/global_appbar.dart';
import '../../../../utils/enum.dart';
import '../../../../utils/styles/styles.dart';

class RemoveSymbolScreen extends StatelessWidget {
  const RemoveSymbolScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.scafoldBg.color,
      appBar: GlobalAppbar(
        isShowMenubar: false,
        title: "Remove Symbol",
        isLeading: true,
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              decoration: BoxDecoration(
                color: KColor.white.color,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: KColor.stroke.color, width: 1),
              ),
              child: GlobalTextFormField(
                labelText: "Search Here",
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GlobalSvgLoader(
                    imagePath: KAssetName.search.imagePath,
                    svgFor: SvgFor.asset,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.separated(
                  itemCount: 50,
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 1,
                      color: KColor.separator.color,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: GlobalSvgLoader(
                        imagePath: KAssetName.remove.imagePath,
                        svgFor: SvgFor.asset,
                      ),
                      title: GlobalText(
                        str: "AUDCAD",
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                      minLeadingWidth: 10,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
