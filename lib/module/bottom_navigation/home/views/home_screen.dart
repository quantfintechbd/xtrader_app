import 'package:flutter/material.dart';
import 'package:xtrader_app/global/widget/global_appbar.dart';
import 'package:xtrader_app/global/widget/global_svg_loader.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/styles/k_colors.dart';
import 'package:xtrader_app/utils/styles/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.scafoldBg.color,
      appBar: GlobalAppbar(
        isShowMenubar: true,
        title: "Home",
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: GlobalSvgLoader(
              imagePath: KAssetName.add.imagePath,
              svgFor: SvgFor.asset,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: GlobalSvgLoader(
              imagePath: KAssetName.edit.imagePath,
              svgFor: SvgFor.asset,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: Text(
            "Home Setup",
          ),
        ),
      ),
    );
  }
}
