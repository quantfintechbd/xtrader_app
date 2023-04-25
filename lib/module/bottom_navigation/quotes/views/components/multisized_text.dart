import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xtrader_app/utils/extension.dart';

import '../../../../../utils/styles/styles.dart';

class MultisizedText extends StatelessWidget {
  const MultisizedText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    List<String> parts = text.split('.');

    return Text.rich(
      TextSpan(
        children: <InlineSpan>[
          makeSmallText(parts.first),
          makeSmallText('.'),
          parts.last.length == 5
              ? TextSpan(
                  children: [
                    makeSmallText(
                      parts.last.substring(0, 2),
                    ),
                    makeLargeText(
                      parts.last.substring(2, 4),
                    ),
                    makeSmallText(
                      parts.last.substring(4, parts.last.length),
                    ),
                  ],
                )
              : parts.last.length == 4
                  ? TextSpan(
                      children: [
                        makeSmallText(
                          parts.last.substring(0, 1),
                        ),
                        makeLargeText(
                          parts.last.substring(1, 3),
                        ),
                        makeSmallText(
                            parts.last.substring(3, parts.last.length)),
                      ],
                    )
                  : parts.last.length == 3
                      ? TextSpan(
                          children: [
                            makeLargeText(
                              parts.last.substring(0, 2),
                            ),
                            makeSmallText(
                              parts.last.substring(2, parts.last.length),
                            ),
                          ],
                        )
                      : parts.last.length == 2
                          ? TextSpan(
                              children: [
                                makeLargeText(
                                    parts.last.substring(0, parts.last.length))
                              ],
                            )
                          : makeSmallText(parts.last),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  TextSpan makeLargeText(String parts) {
    return TextSpan(
      text: parts,
      style: KTextStyle.customTextStyle(
        color: KColor.white.color,
        fontSize: 26.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  TextSpan makeSmallText(String parts) {
    return TextSpan(
      text: parts,
      style: KTextStyle.customTextStyle(
        color: KColor.white.color,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
