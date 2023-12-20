import 'package:flutter/material.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';
import 'package:teste_firebase_web/core/common/extensions/widget_extension.dart';

class ShimmedBox extends StatelessWidget {
  const ShimmedBox({
    super.key,
    this.height,
    this.width,
    this.margin,
    this.padding,
  });

  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: AppColors.grey50,
      ),
    ).shim();
  }
}
