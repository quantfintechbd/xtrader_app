import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_app_bar/global_appbar.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/global/widget/global_textformfield.dart';
import 'package:xtrader_app/module/symbol/add_symbol/controller/add_symbol_controller.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/extension.dart';
import 'package:xtrader_app/utils/styles/k_assets.dart';
import 'package:xtrader_app/utils/styles/k_text_style.dart';

import '../../../../utils/styles/k_colors.dart';

class AddSymbolScreen extends StatelessWidget {
  const AddSymbolScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read(addSymbolProvider.notifier);
    final state = context.read(addSymbolProvider);

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
            SizedBox(
              height: 10.h,
            ),
            GlobalTextFormField(
              style: KTextStyle.customTextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp),
              controller: state.searchController,
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
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: Consumer(builder: (context, ref, snapshot) {
                final state = ref.watch(addSymbolProvider);
                return state.isLoading
                    ? Center(
                        child: centerCircularProgress(
                            progressColor: KColor.primary.color),
                      )
                    : ListView.separated(
                        itemCount: state.unAttended.length,
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 1,
                            color: KColor.separator.color,
                          );
                        },
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              controller.addLocal(state.unAttended[index]);
                            },
                            contentPadding: EdgeInsets.zero,
                            leading: GlobalSvgLoader(
                              imagePath: KAssetName.addGreen.imagePath,
                              svgFor: SvgFor.asset,
                            ),
                            title: GlobalText(
                              str: state.unAttended[index],
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                            minLeadingWidth: 10,
                          );
                        });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
