import 'package:teste_firebase_web/core/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, this.size, this.inverted = false});

  final double? size;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 30,
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: inverted ? AppColors.white : AppColors.secondary,
        size: size ?? 30,
      ),
    );
  }
}
