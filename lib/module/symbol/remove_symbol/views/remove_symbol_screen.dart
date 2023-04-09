import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/global/widget/global_text.dart';
import 'package:xtrader_app/global/widget/global_textformfield.dart';
import 'package:xtrader_app/module/symbol/remove_symbol/controller/remove_symbol_controller.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../../../../global/widget/global_app_bar/global_appbar.dart';
import '../../../../utils/enum.dart';
import '../../../../utils/styles/styles.dart';

class RemoveSymbolScreen extends StatelessWidget {
  const RemoveSymbolScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read(removeSymbolProvider.notifier);
    final state = context.read(removeSymbolProvider);
    Future(() => controller.filterSymbols());
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
            GlobalTextFormField(
              style: KTextStyle.customTextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp),
              controller: state.searchController,
              labelText: "Search Here",
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
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
                final state = ref.watch(removeSymbolProvider);
                return ListView.separated(
                    itemCount: state.filtered.length,
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 1,
                        color: KColor.separator.color,
                      );
                    },
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          controller.removeSymbol(state.filtered[index]);
                        },
                        contentPadding: EdgeInsets.zero,
                        leading: GlobalSvgLoader(
                          imagePath: KAssetName.remove.imagePath,
                          svgFor: SvgFor.asset,
                        ),
                        title: GlobalText(
                          str: state.filtered[index],
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
