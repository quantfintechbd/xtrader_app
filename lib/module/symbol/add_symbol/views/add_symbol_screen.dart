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

class AddSymbolScreen extends ConsumerWidget {
  const AddSymbolScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = context.read(addSymbolProvider.notifier);
    final state = ref.watch(addSymbolProvider);

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
        child: state.isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  GlobalText(
                    str: "Loading Symbols...",
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  LinearProgressIndicator(
                    value: state.totalCount > 0
                        ? state.remoteSymbols.length / state.totalCount
                        : 0.0,
                    backgroundColor: KColor.reverseDark.color,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                  Spacer(),
                  GlobalText(
                    str:
                        "Loading ${state.endIndex} of ${state.totalCount} symbols",
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: KColor.scondaryTextColor.color,
                  ),
                ],
              )
            : Column(
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
                      padding: EdgeInsets.symmetric(
                          vertical: 10.w, horizontal: 10.h),
                      child: GlobalSvgLoader(
                        imagePath: KAssetName.search.imagePath,
                        svgFor: SvgFor.asset,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: KColor.stroke.color, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                      child: ListView.separated(
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
                    },
                  )),
                ],
              ),
      ),
    );
  }
}
