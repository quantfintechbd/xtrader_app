import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:xtrader_app/utils/styles/k_colors.dart';
import 'package:xtrader_app/utils/styles/k_text_style.dart';

import '../controller/bottom_navigation_controller.dart';

class BottomNavigationScreen extends ConsumerWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(bottomNavigationProvider.notifier);
    final state = ref.watch(bottomNavigationProvider);
    return Scaffold(
      body: controller.screen,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: KColor.scafoldBg.color,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: KColor.primary.color,
          // textTheme: Theme.of(context).textTheme.copyWith(),
        ), // sets the inactive color of the `BottomNavigationBar`
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
              fontWeight: FontWeight.w500),
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
