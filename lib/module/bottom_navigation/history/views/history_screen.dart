import 'package:flutter/material.dart';
import 'package:xtrader_app/global/widget/global_appbar.dart';

import '../../../../global/widget/global_svg_loader.dart';
import '../../../../utils/enum.dart';
import '../../../../utils/styles/k_assets.dart';
import '../../../../utils/styles/k_colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("History Setup"),
      ),
    );
  }
}
