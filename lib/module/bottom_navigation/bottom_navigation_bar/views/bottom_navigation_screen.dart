import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/global/widget/app_drawer.dart';
import 'package:xtrader_app/global/widget/global_appbar.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/utils/app_routes.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/navigation.dart';

import '../../../../utils/styles/styles.dart';
import '../controller/bottom_navigation_controller.dart';

class BottomNavigationScreen extends ConsumerWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(bottomNavigationProvider.notifier);
    final state = ref.watch(bottomNavigationProvider);
    return Scaffold(
      backgroundColor: KColor.scafoldBg.color,
      drawer: GlobalAppDrawer(),
      appBar: controller.getAppBar(context),
      body: controller.screen,
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: KColor.scafoldBg.color,
        ),
        child: BottomNavigationBar(
          onTap: (value) {
            controller.changeTap(value);
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: state.selectedTab,
          items: state.barItems,
          selectedLabelStyle: KTextStyle.customTextStyle(
            color: KColor.primary.color,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          selectedItemColor: KColor.primary.color,
          unselectedLabelStyle: KTextStyle.customTextStyle(
              color: KColor.textColorDark.color,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal),
          unselectedItemColor: KColor.textColorDark.color,
        ),
      ),
    );
  }
}
