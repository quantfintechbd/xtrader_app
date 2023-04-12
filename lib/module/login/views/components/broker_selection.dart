import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_image_loader.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/navigation.dart';
import 'package:xtrader_app/utils/styles/styles.dart';

import '../../../../global/widget/global_text.dart';
import '../../../../global/widget/global_textformfield.dart';

class BrokerSelectionSheet extends StatelessWidget {
  const BrokerSelectionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KColor.popupBg.color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.r),
          topLeft: Radius.circular(10.r),
        ),
      ),
      height: context.height * 0.6,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                GlobalText(
                  str: 'Select Broker',
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigation.pop(context);
                  },
                  child: GlobalSvgLoader(
                    imagePath: KAssetName.close.imagePath,
                    svgFor: SvgFor.asset,
                    color: KColor.scondaryTextColor.color,
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            color: KColor.separator.color,
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GlobalTextFormField(
              style: KTextStyle.customTextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp),
              //controller: state.searchController,
              hintText: "Search",
              //labelText: "Search Here",
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.h),
                child: GlobalSvgLoader(
                  imagePath: KAssetName.search.imagePath,
                  svgFor: SvgFor.asset,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: KColor.stroke.color, width: 1),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12.0),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigation.pop(context);
                  },
                  leading: GlobalImageLoader(
                    imagePath:
                        "https://www.cse.com.bd/upload_trec/8f38e7bedef0511f2715b1acef3e24f0.jpg",
                    imageFor: ImageFor.network,
                    width: 26,
                    height: 26,
                  ),
                  minLeadingWidth: 5,
                  title: GlobalText(
                    str: "Base Capital Ltd",
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
