import 'package:flutter/material.dart';

import '../theme/theme_util.dart';

enum KColor {
  primary,
  secondary,
  textColorDark,
  white,
  scondaryTextColor,
  stroke,
  red,
  scafoldBg,
  textHintColor,
  d6d6d6,
  sixA6a6a,
  spaceCadet,
  separator,
  popupBg,
  mineShaft,
  mineShaftCommmon,
  reverseDark,
}

extension KColorExtention on KColor {
  Color get color {
    switch (this) {
      case KColor.primary:
        return const Color(0xff0CAF82);
      case KColor.secondary:
        return const Color(0xff0CAF82);
      case KColor.textColorDark:
        return _themedColor(forDark: Colors.white, forlight: Colors.black);

      case KColor.white:
        return Colors.white;
      case KColor.scondaryTextColor:
        return _themedColor(
            forDark: Color(0xffC7C7CC), forlight: const Color(0xff48484A));
      case KColor.textHintColor:
        return const Color(0xffA6A9AE);
      case KColor.stroke:
        return const Color(0xff6C7583);
      case KColor.red:
        return const Color(0xffFB3B54);
      case KColor.scafoldBg:
        return _themedColor(forDark: Colors.black, forlight: Colors.white);
      case KColor.d6d6d6:
        return const Color(0xffD6D6D6);
      case KColor.sixA6a6a:
        return const Color(0xff6A6A6A);
      case KColor.spaceCadet:
        return _themedColor(
          forDark: const Color(0xff18335B),
          forlight: const Color(0xffE1E1E1),
        );
      case KColor.separator:
        return _themedColor(
          forDark: const Color(0xff545458).withOpacity(0.65),
          forlight: const Color(0xffEBEBEB),
        );
      case KColor.popupBg:
        return _themedColor(
          forDark: const Color(0xff0B1A31),
          forlight: const Color(0xffFFFFFF),
        );
      case KColor.mineShaft:
        return _themedColor(
          forDark: const Color(0xff232323),
          forlight: const Color(0xffF7F7F7),
        );
      case KColor.mineShaftCommmon:
        return const Color(0xff232323);
      case KColor.reverseDark:
        return _themedColor(
          forDark: const Color(0xffE1E1E1),
          forlight: const Color(0xff18335B),
        );
      default:
        return Colors.blue;
    }
  }

  Color _themedColor({required Color forDark, required Color forlight}) {
    return ThemeUtil.appTheme == XtraderTheme.light ? forlight : forDark;
  }
}
