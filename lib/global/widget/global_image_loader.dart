import 'package:flutter/material.dart';
import 'package:xtrader_app/utils/enum.dart';
import 'package:xtrader_app/utils/extension.dart';

class GlobalImageLoader extends StatelessWidget {
  const GlobalImageLoader({
    Key? key,
    required this.imagePath,
    required this.imageFor,
    this.height,
    this.width,
    this.fit,
  }) : super(key: key);
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final ImageFor imageFor;
  @override
  Widget build(BuildContext context) {
    if (imageFor == ImageFor.network) {
      imagePath.log();
      return Image.network(
        imagePath,
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (context, exception, stackTrace) => const Text('😢'),
      );
    } else {
      return Image.asset(
        imagePath,
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (context, exception, stackTrace) => const Text('😢'),
      );
    }
  }
}
